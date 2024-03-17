## ALB SG ##

variable "pub_alb-sg" {
  description = "alb sec group"
}

variable "ecs-sg" {
  description = "ecs sec group"
}

variable "rds-postgre_sql-sg" {
  description = "rds sec group"
}

variable "vpc_id" {
  description = "vpc id"
}
variable "alb_sg_from_port" {
  description = "alb sg from port"
}
variable "alb_sg_to_port" {
  description = "alb sg to port"
}
variable "alb_sg_protocol" {
  description = "alb sg protocol"
}
variable "alb_sg_cidr_block" {
  description = "alb sg cidr block"
}
variable "ecs_sg_from_port" {
  description = "ecs sg from port"
}
variable "ecs_sg_to_port" {
  description = "ecs sg to port"
}
variable "ecs_sg_protocol" {
  description = "ecs sg protocol"
}
variable "rds_sg_from_port" {
  description = "rds sg from port"
}
variable "rds_sg_to_port" {
  description = "rds sg to port"
}
variable "rds_sg_protocol" {
  description = "rds sg protocol"
}