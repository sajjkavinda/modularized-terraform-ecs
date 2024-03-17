output "ecs_security_group" {
  value = aws_security_group.ecs-sg
}

output "rds_security_group" {
  value = aws_security_group.rds-postgre_sql-sg
}

output "alb_security_group" {
  value = aws_security_group.pub_alb-sg
}