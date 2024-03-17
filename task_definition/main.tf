resource "aws_ecs_task_definition" "task_definition" {

  family = var.task_definition_family
  network_mode = var.network_mode
  requires_compatibilities = ["FARGATE"]
  cpu    = var.task_cpu
  memory = var.task_memory
  execution_role_arn = var.ecs_task_execution_role.arn

  # lifecycle {
  #   ignore_changes  = all
  # }

  container_definitions = jsonencode([

    {

      name = var.container_name
      image = var.ecr_image
      data = var.ecr_image_data
      cpu = var.container_cpu
      memory = var.container_memory
      essential = true
  
      portMappings = [for mapping in var.port_mappings : {
        containerPort = mapping.containerPort
        hostPort      = mapping.hostPort
        protocol      = mapping.protocol
      }]

      log_configuration = {
        log_driver = var.log_driver
        options = {
          "awslogs-group"  = var.awslogs_group
          "awslogs-region" = var.awslogs_region
          "awslogs-stream-prefix" = var.awslogs_stream_prefix
        }
      }
    }

  ])

}