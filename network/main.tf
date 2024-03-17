#################################################################################################
###                                              VPC                                          ###
#################################################################################################
resource "aws_vpc" "vpc-main" {
  cidr_block           = var.cidr_block_main_vpc
  instance_tenancy     = var.instance_tenancy_main_vpc
  enable_dns_support   = var.enable_dns_support_main_vpc
  enable_dns_hostnames = var.enable_dns_hostnames_main_vpc
  tags                 = var.tags_main_vpc

  # lifecycle {
  #   prevent_destroy = true
  #   ignore_changes  = all
  # }

}

#################################################################################################
###                                            IGW                                            ###
#################################################################################################

resource "aws_internet_gateway" "igw-main" {
  vpc_id = aws_vpc.vpc-main.id
  tags   = var.tags_igw
}

#################################################################################################
###                                            Subnets                                        ###
#################################################################################################

############## RDS - Subnets ##############

resource "aws_subnet" "subnet-rds_sub_1" {
  vpc_id            = aws_vpc.vpc-main.id
  cidr_block        = var.cidr_block_rds_subnet_1
  availability_zone = var.availability_zone_rds_subnet_1


  tags = var.tags_rds_subnet_1
}


resource "aws_subnet" "subnet-rds_sub_2" {
  vpc_id            = aws_vpc.vpc-main.id
  cidr_block        = var.cidr_block_rds_subnet_2
  availability_zone = var.availability_zone_rds_subnet_2

  tags = var.tags_rds_subnet_2
}

############## ALB - Subnet ##############

resource "aws_subnet" "subnet-alb_sub_1" {
  vpc_id            = aws_vpc.vpc-main.id
  cidr_block        = var.cidr_block_alb_subnet_1
  availability_zone = var.availability_zone_alb_subnet_1

  tags = var.tags_alb_subnet_1
}

resource "aws_subnet" "alb_sub_2" {
  vpc_id            = aws_vpc.vpc-main.id
  cidr_block        = var.cidr_block_alb_subnet_2
  availability_zone = var.availability_zone_alb_subnet_2

  tags = var.tags_alb_subnet_2
}

############## NAT - Subnet ##############

resource "aws_eip" "natgw_eip" {
  tags = var.tags_nat_eip

  # lifecycle {
  #   prevent_destroy = true
  # }
}

resource "aws_nat_gateway" "pub_subnet-natgw" {
  subnet_id     = aws_subnet.subnet-alb_sub_1.id
  allocation_id = aws_eip.natgw_eip.id
  tags          = var.tags_nat_gateway
  depends_on    = [aws_internet_gateway.igw-main]
}

############## ECS - Subnet ##############


resource "aws_subnet" "pvt_subnet-ecs" {
  vpc_id            = aws_vpc.vpc-main.id
  cidr_block        = var.cidr_block_ecs_subnet
  availability_zone = var.availability_zone_ecs_subnet

  tags = var.tags_ecs_subnet
}

#################################################################################################
###                                    Rout Tables                                            ###
#################################################################################################

############## ALB - RT ##############

resource "aws_route_table" "alb-pub_rt" {

  vpc_id = aws_vpc.vpc-main.id
  route {
    cidr_block = var.cidr_block_alb_route_table
    gateway_id = aws_internet_gateway.igw-main.id
  }
  tags = var.tags_alb_route_table
}

############## ECS - RT ##############

resource "aws_route_table" "ecs-pvt_rt" {

  vpc_id = aws_vpc.vpc-main.id
  route {
    cidr_block = var.cidr_block_ecs_route_table
    gateway_id = aws_nat_gateway.pub_subnet-natgw.id
  }
  tags = var.tags_ecs_route_table
}

############## RDS - RT ##############

resource "aws_route_table" "rds_psql-pvt_rt_1" {

  vpc_id = aws_vpc.vpc-main.id
  route {
    cidr_block = var.cidr_block_rds_route_table
    gateway_id = aws_internet_gateway.igw-main.id
  }
  tags = var.tags_rds_route_table
}

#################################################################################################
###                                    Rout Tables - Association                              ###
#################################################################################################

############## ALB - RT_Association ##############

resource "aws_route_table_association" "alb-pub_rt-with-pub_subnet-alb_sub_1" {

  subnet_id      = aws_subnet.subnet-alb_sub_1.id
  route_table_id = aws_route_table.alb-pub_rt.id
}

resource "aws_route_table_association" "alb-pub_rt-with-pub_subnet-alb_sub_2" {

  subnet_id      = aws_subnet.alb_sub_2.id
  route_table_id = aws_route_table.alb-pub_rt.id
}

############## ECS - RT_Association ##############

resource "aws_route_table_association" "ecs-pvt_rt-with-pvt_subnet-ecs" {

  subnet_id      = aws_subnet.pvt_subnet-ecs.id
  route_table_id = aws_route_table.ecs-pvt_rt.id
}

############## RDS - RT_Association ############## 

resource "aws_route_table_association" "rds_psql-pvt_rt_1-with-pvt_subnet-rds_sub_1" {

  subnet_id      = aws_subnet.subnet-rds_sub_2.id
  route_table_id = aws_route_table.rds_psql-pvt_rt_1.id
}

resource "aws_route_table_association" "rds_psql-pvt_rt_1-with-pvt_subnet-rds_sub_2" {

  subnet_id      = aws_subnet.subnet-rds_sub_2.id
  route_table_id = aws_route_table.rds_psql-pvt_rt_1.id
}


#################################################################################################
###                                          ALB                                              ###
#################################################################################################

################# ALB ####################
resource "aws_lb" "pub_alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = var.alb_type
  security_groups    = [var.pub_alb_sg.id]
  subnets            = [aws_subnet.subnet-alb_sub_1.id, aws_subnet.alb_sub_2.id]

  enable_deletion_protection = true

  # lifecycle {
  # prevent_destroy = true
  # ignore_changes  = all
  # }

}

################# TG ########################

resource "aws_lb_target_group" "alb-tg" {
  depends_on = [
    var.pub_alb_sg
  ]
  name        = var.target_group_name
  port        = var.target_group_port
  protocol    = var.target_group_protocol
  target_type = var.target_group_target_type
  # port     = 443
  # protocol = "HTTPS"
  # target_type = "ip"
  vpc_id = aws_vpc.vpc-main.id

  # lifecycle {
  #   prevent_destroy = true
  #   ignore_changes  = all
  #   }

  tags = {
    Name = var.target_group_name
  }
}
# resource "aws_lb_target_group_attachment" "nonp-somsv2-apse1-pub-alb-tg-attach" {

#     target_group_arn = aws_lb_target_group.nonp-somsv2-apse1-pub-alb-tg.arn
#     target_id        = aws_ecs_task_definition.nonp-soms_v2-apse1-ecs_task-def.id
#     port             = 80
# }

################# Listner-Rule ########################

resource "aws_lb_listener" "pub_alb-tg-listner" {
  load_balancer_arn = aws_lb.pub_alb.arn

  port            = var.alb_listener_port
  protocol        = var.alb_listener_protocol
  # certificate_arn = var.alb_listener_certificate_arn
  #ssl_policy       = "ELBSecurityPolicy-2016-08"

  default_action {
    type = var.alb_listener_default_action_type
    target_group_arn = aws_lb_target_group.alb-tg.arn
  }

  # lifecycle {
  #   prevent_destroy = true
  #   ignore_changes  = all
  # }

  depends_on = [
    aws_lb_target_group.alb-tg,
  ]
}

resource "aws_lb_listener_rule" "rule" {
  listener_arn = aws_lb_listener.pub_alb-tg-listner.arn

  action {
    type             = var.listener_rule_action_type
    target_group_arn = aws_lb_target_group.alb-tg.arn
  }

  condition {
    path_pattern {
      values = [var.listener_rule_condition_path_pattern]
    }
  }

  condition {
    host_header {
      values = [var.listener_rule_condition_host_header]
    }
  }


}











