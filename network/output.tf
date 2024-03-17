# VPC Outputs
output "vpc_id" {
  value       = aws_vpc.vpc-main.id
  description = "The ID of the main VPC"
}

# Subnet Outputs
output "public_subnet_ids" {
  value = [
    aws_subnet.subnet-alb_sub_1.id,
    aws_subnet.alb_sub_2.id
  ]
  description = "IDs of the public subnets for the ALB"
}

output "private_rds_subnet_ids" {
  value = [
    aws_subnet.subnet-rds_sub_1.id,
    aws_subnet.subnet-rds_sub_2.id
  ]
  description = "IDs of the private subnets for RDS"
}

output "private_ecs_subnet_id" {
  value       = aws_subnet.pvt_subnet-ecs
  description = "ID of the private subnet for ECS tasks"
}

# Internet Gateway Output
output "internet_gateway_id" {
  value       = aws_internet_gateway.igw-main.id
  description = "The ID of the Internet Gateway"
}

# NAT Gateway Output
output "nat_gateway_id" {
  value       = aws_nat_gateway.pub_subnet-natgw.id
  description = "The ID of the NAT Gateway"
}

output "nat_gateway_eip" {
  value       = aws_eip.natgw_eip.public_ip
  description = "The public IP address of the NAT Gateway"
}

# Load Balancer Outputs
output "alb_dns_name" {
  value       = aws_lb.pub_alb.dns_name
  description = "The DNS name of the Application Load Balancer"
}

output "alb_arn" {
  value       = aws_lb.pub_alb.arn
  description = "The ARN of the Application Load Balancer"
}

# Target Group Outputs
output "target_group_arn" {
  value       = aws_lb_target_group.alb-tg
  description = "The ARN of the  target group"
}


output "pvt_subnet-rds_sub_1" {
  value = aws_subnet.subnet-rds_sub_1
}

output "pvt_subnet-rds_sub_2" {
  value = aws_subnet.subnet-rds_sub_2
}