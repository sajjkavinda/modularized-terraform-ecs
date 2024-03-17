# ECS Cluster

resource "aws_ecs_cluster" "ecs_cluster" {

  name = lower(var.cluster_name)

}

resource "aws_iam_role_policy_attachment" "ecs-task-execution-role-policy-attachment" {

  role = var.ecs_task_execution_role.name

  policy_arn = var.ecs_task_execution_role_policy.arn

}

resource "aws_ecs_service" "ecs_service" {

  # lifecycle {
  #   create_before_destroy = true
  #   ignore_changes  = all

  # }

  name = var.service_name

  cluster = aws_ecs_cluster.ecs_cluster.name

  task_definition = var.task_definition.arn

  desired_count = var.desired_count

  deployment_controller {
    type = "ECS"
  }


    load_balancer {
          target_group_arn = var.tg
          container_name   = var.container_name
          container_port   = var.container_port[0]
          }


  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent

  deployment_maximum_percent = var.deployment_maximum_percent

  launch_type = var.launch_type

  network_configuration {

    subnets = [var.private-subnet.id]

    security_groups = [var.sg_ecs.id]

  }

  depends_on = [

    var.ecs-task-execution-role-policy-attachment,
    var.pub_alb

  ]

}

#Auto Scaling Targets and Policies

resource "aws_appautoscaling_target" "replicas" {

  max_capacity = 1

  min_capacity = 1

  resource_id = "service/${aws_ecs_cluster.ecs_cluster.name}/${aws_ecs_service.ecs_service.name}"

  role_arn = var.ecs_task_execution_role.arn

  scalable_dimension = "ecs:service:DesiredCount"

  service_namespace = "ecs"

}

resource "aws_appautoscaling_policy" "replicas-memory" {

  name = "memory-auto-scaling"

  service_namespace = aws_appautoscaling_target.replicas.service_namespace

  scalable_dimension = aws_appautoscaling_target.replicas.scalable_dimension

  resource_id = aws_appautoscaling_target.replicas.resource_id

  policy_type = "TargetTrackingScaling"

  target_tracking_scaling_policy_configuration {

    predefined_metric_specification {

      predefined_metric_type = "ECSServiceAverageMemoryUtilization"

    }

    target_value = 75

    scale_in_cooldown = 300

    scale_out_cooldown = 300

  }

}

resource "aws_appautoscaling_policy" "replicas-cpu" {

  name = "cpu-auto-scaling"

  service_namespace = aws_appautoscaling_target.replicas.service_namespace

  scalable_dimension = aws_appautoscaling_target.replicas.scalable_dimension

  resource_id = aws_appautoscaling_target.replicas.resource_id

  policy_type = "TargetTrackingScaling"

  target_tracking_scaling_policy_configuration {

    predefined_metric_specification {

      predefined_metric_type = "ECSServiceAverageCPUUtilization"

    }

    target_value = 70

    scale_in_cooldown = 300

    scale_out_cooldown = 300

  }

}