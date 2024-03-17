output "task_definition" {
  value = aws_ecs_task_definition.task_definition
}
output "container_name" {
  value = var.container_name
}
output "container_port" {
  value = [for entry in var.port_mappings : entry.containerPort]
}
