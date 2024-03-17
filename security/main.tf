
#################################################################################################
###                                            ALB SG                                         ###
#################################################################################################

resource "aws_security_group" "pub_alb-sg" {
  name        = var.pub_alb-sg
  description = "Manage ALB traffic"
  vpc_id      = var.vpc_id

  ingress {
    description      = "Access from the Internet - HTTPS"
    from_port        = var.alb_sg_from_port
    to_port          = var.alb_sg_to_port
    protocol         = var.alb_sg_protocol
    cidr_blocks      = [var.alb_sg_cidr_block]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "pub_alb-sg"
  }
}

#################################################################################################
###                                            ECS SG                                         ###
#################################################################################################


resource "aws_security_group" "ecs-sg" {
  name        = var.ecs-sg
  description = "Security group for ECS Fargate tasks which allows traffic from ALB"
  vpc_id = var.vpc_id

  # Allow all outbound traffic
  ingress {
    from_port        = var.ecs_sg_from_port
    to_port          = var.ecs_sg_to_port
    protocol         = var.ecs_sg_protocol
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ecs-sg"
  }
}

#################################################################################################
###                                            RDS SG                                         ###
#################################################################################################

resource "aws_security_group" "rds-postgre_sql-sg" {
  name        = var.rds-postgre_sql-sg
  description = "Security group for RDS (Aurora PostgreSQL) which allow inbound traffic from ECS security group"
  vpc_id = var.vpc_id

  # Allow incoming traffic from ECS Fargate on the 5432 port
  ingress {
    from_port        = var.rds_sg_from_port
    to_port          = var.rds_sg_to_port
    protocol         = var.rds_sg_protocol
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-sg"

  }
}
