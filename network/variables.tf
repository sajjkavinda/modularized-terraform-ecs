#################################################################################################
###                                              VPC                                          ###
#################################################################################################

variable "cidr_block_main_vpc" {
  description = "cidr block of the main VPC"
}

variable "instance_tenancy_main_vpc" {
  description = "instance tenancy of the main VPC"
}
variable "enable_dns_support_main_vpc" {
  description = "enable dns support of the main VPC"
}
variable "enable_dns_hostnames_main_vpc" {
  description = "enable dns hostnames of the main VPC"
}
variable "aws_region" {
  description = "aws region"
}
variable "tags_main_vpc" {
  description = "tags of the main VPC"
}

#################################################################################################
###                                            IGW                                            ###
#################################################################################################

variable "tags_igw" {
  description = "tags of the internet gateway"
}

#################################################################################################
###                                            Subnets                                        ###
#################################################################################################

############## RDS - Subnets ##############
variable "cidr_block_rds_subnet_1" {
  description = "cidr block of the rds subnet"
}
variable "availability_zone_rds_subnet_1" {
  description = "availability zone of the rds subnet"
}
variable "tags_rds_subnet_1" {
  description = "tags of the rds subnet"
}
#rds subnet 2
variable "cidr_block_rds_subnet_2" {
  description = "cidr block of the rds subnet"
}
variable "availability_zone_rds_subnet_2" {
  description = "availability zone of the rds subnet"
}
variable "tags_rds_subnet_2" {
  description = "tags of the rds subnet"
}

#alb subnet 1
variable "cidr_block_alb_subnet_1" {
  description = "cidr block of the alb subnet"
}
variable "availability_zone_alb_subnet_1" {
  description = "availability zone of the alb subnet"
}
variable "tags_alb_subnet_1" {
  description = "tags of the alb subnet"
}
#alb subnet 2
variable "cidr_block_alb_subnet_2" {
  description = "cidr block of the alb subnet"
}
variable "availability_zone_alb_subnet_2" {
  description = "availability zone of the alb subnet"
}
variable "tags_alb_subnet_2" {
  description = "tags of the alb subnet"
}

#nat subnet eip
variable "tags_nat_eip" {
  description = "tags of the nat eip"
}

#aws nat gateway
variable "tags_nat_gateway" {
  description = "tags of the nat eip"
}


#ecs subnet 
variable "cidr_block_ecs_subnet" {
  description = "cidr block of the ecs subnet"
}
variable "availability_zone_ecs_subnet" {
  description = "availability zone of the ecs subnet"
}
variable "tags_ecs_subnet" {
  description = "tags of the ecs subnet"
}

#route tables 
#alb route table 
variable "tags_alb_route_table" {
  description = "tags of the alb route table"
}
variable "cidr_block_alb_route_table" {
  description = "cidr block of the ecs subnet"
}

#ecs route table
variable "tags_ecs_route_table" {
  description = "tags of the ecs route table"
}
variable "cidr_block_ecs_route_table" {
  description = "cidr block of the ecs subnet"
}
#rds route table
variable "tags_rds_route_table" {
  description = "tags of the rds route table"
}
variable "cidr_block_rds_route_table" {
  description = "cidr block of the ecs subnet"
}

#Application Load balancer
variable "alb_name" {
  description = "name of the alb"
}
variable "alb_type" {
  description = "type of the alb"
}
variable "alb_internal" {
  description = "internal or not of the alb : true or false"
}
variable "public_alb_enable_deletion_protection" {
  description = "deletion protection of the alb : true or false"
}

variable "tags_alb" {
  description = "tags of the alb"
}


#target groups
#target group fe1

variable "target_group_name" {
  description = "name of the target group"
}
variable "target_group_port" {
  description = "port of the target group"
}

variable "target_group_protocol" {
  description = "protocol of the target group"

}
variable "target_group_target_type" {
  description = "target type of the target group"
}
variable "target_group_tags" {
  description = "tags of the target group"
}

# Listner
variable "alb_listener_port" {
  description = "port of the listener"
}
variable "alb_listener_protocol" {
  description = "protocol of the listener"
}
# variable "alb_listener_certificate_arn" {
#   description = "certificate of the listener"
# }
variable "alb_listener_default_action_type" {
}
#listner fe1 rule
variable "listener_rule_priority" {
  description = "priority of the listener"
}
variable "listener_rule_action_type" {
  description = "action type of the listener"
}
variable "listener_rule_condition_path_pattern" {
  description = "condition path pattern of the listener"
}
variable "listener_rule_condition_host_header" {
  description = "condition host header of the listener"
}
variable "pub_alb_sg" {
  
}










