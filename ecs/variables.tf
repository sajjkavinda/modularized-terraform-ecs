variable "cluster_name" {
  description = "value of the cluster name"
}
variable "service_name" {
  description = "value of the service-frontend name"
}
variable "task_definition" {
  description = "value of the task definition"
}
variable "container_name" {
  description = "value of the container frontend-1 name"
}
variable "container_port" {
  description = "value of the container frontend-2 port"
}
variable "deployment_minimum_healthy_percent" {
  description = "value of the deployment minimum healthy percent"
}
variable "deployment_maximum_percent" {
  description = "value of the deployment maximum percent"
}
variable "launch_type" {
  description = "value of the launch type"
}
variable "private-subnet" {
  description = "value of the private subnet"
}
variable "sg_ecs" {
  description = "value of the security group ecs"
}
variable "ecs-task-execution-role-policy-attachment" {
  description = "value of the ecs task execution role policy attachment"
}
variable "pub_alb" {
  description = "value of the public alb"
}
variable "desired_count" {
  description = "value of the desired count"
}
variable "tg" {
  description = "value of the target group"
}
variable "ecs_task_execution_role" {
  description = "value of the ecs task execution role"
}
variable "ecs_task_execution_role_policy" {
  description = "value of the ecs task execution role policy"
}
