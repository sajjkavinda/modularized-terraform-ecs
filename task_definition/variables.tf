variable "task_definition_family" {
  description = "value of the task definition family"
}
variable "network_mode" {
  description = "value of the network mode"
}
variable "task_cpu" {
  description = "value of the task cpu"
}
variable "task_memory" {
  description = "value of the task memory"
}
variable "ecs_task_execution_role" {
  description = "value of the ecs task execution role"
}
variable "container_name" {
  description = "value of the container name"
}
variable "ecr_image" {
  description = "value of the ecr image"
}
variable "ecr_image_data" {
  description = "value of the ecr image data"
}
variable "container_cpu" {
  description = "value of the container cpu"
}
variable "container_memory" {
  description = "value of the container memory"
}

variable "port_mappings" {
  type = list(object({
    hostPort      = number
    containerPort = number
    protocol      = string
  }))
}
variable "log_driver" {
  description = "value of the log driver"
}
variable "awslogs_group" {
  description = "value of the awslogs group"
}
variable "awslogs_region" {
  description = "value of the awslogs region"
}
variable "awslogs_stream_prefix" {
  description = "value of the awslogs stream prefix"
}

