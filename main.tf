module "ecs_service" {
  source                                    = "./ecs"
  cluster_name                              = var.cluster_name
  service_name                              = var.service_name
  task_definition                           = module.task_definition.task_definition
  container_name                            = module.task_definition.container_name
  container_port                            = module.task_definition.container_port
  deployment_minimum_healthy_percent        = var.deployment_minimum_healthy_percent
  deployment_maximum_percent                = var.deployment_maximum_percent
  launch_type                               = var.launch_type
  private-subnet                            = module.network.private_ecs_subnet_id
  sg_ecs                                    = module.security.ecs_security_group
  tg                                        = module.network.target_group_arn.arn
  ecs-task-execution-role-policy-attachment = module.iam.task_execution_role_attachment
  pub_alb                                   = module.network.alb_arn
  desired_count                             = var.desired_count
  ecs_task_execution_role_policy            = module.iam.ecs_task_execution_role_policy
  ecs_task_execution_role                   = module.iam.task_execution_role

}

module "task_definition" {
  source                  = "./task_definition"
  network_mode            = var.network_mode
  log_driver              = var.log_driver
  awslogs_group           = module.cloudwatch.log_group_name
  awslogs_region          = var.awslogs_region
  task_definition_family  = var.task_definition_family
  task_cpu                = var.task_cpu
  task_memory             = var.task_memory
  container_name          = var.container_name
  ecr_image               = var.ecr_image
  ecr_image_data          = var.ecr_image_data
  container_cpu           = var.container_cpu
  container_memory        = var.container_memory
  port_mappings           = var.port_mappings
  awslogs_stream_prefix   = var.awslogs_stream_prefix
  ecs_task_execution_role = module.iam.task_execution_role

}

module "iam" {
  source                   = "./iam"
  ecs_execution-iam_role   = var.ecs_execution-iam_role_name
  pipeline_iam_role_name   = var.pipeline_iam_role_name
  codestar_connection_arn  = module.pipeline.codestar_connection_arn
  codepipeline_bucket      = module.s3.main_bucket_arn
  ecs_execution-iam_policy  = var.ecs_execution-iam_policy
  codepipeline-iam_policy  = var.codepipeline-iam_policy
}

module "network" {
  source                                = "./network"
  aws_region                            = var.aws_region
  availability_zone_alb_subnet_1        = var.availability_zone_alb_subnet_1
  public_alb_enable_deletion_protection = var.public_alb_enable_deletion_protection
  enable_dns_hostnames_main_vpc         = var.enable_dns_hostnames_main_vpc
  listener_rule_condition_host_header   = var.listener_rule_condition_host_header
  listener_rule_condition_path_pattern  = var.listener_rule_condition_path_pattern
  listener_rule_priority                = var.listener_rule_priority
  listener_rule_action_type             = var.listener_rule_action_type
  tags_ecs_subnet                       = var.tags_ecs_subnet
  target_group_name                     = var.target_group_name
  target_group_port                     = var.target_group_port
  target_group_protocol                 = var.target_group_protocol
  target_group_target_type              = var.target_group_target_type
  target_group_tags                     = var.target_group_tags
  alb_name                              = var.alb_name
  # alb_listener_certificate_arn             = var.alb_listener_certificate_arn ## Only for 443
  alb_listener_default_action_type = var.alb_listener_default_action_type
  alb_listener_protocol            = var.alb_listener_protocol
  alb_internal                     = var.alb_internal
  tags_ecs_route_table             = var.tags_ecs_route_table
  cidr_block_rds_subnet_2          = var.cidr_block_rds_subnet_2
  tags_rds_subnet_2                = var.tags_rds_subnet_2
  cidr_block_rds_subnet_1          = var.cidr_block_rds_subnet_1
  tags_rds_subnet_1                = var.tags_rds_subnet_1
  cidr_block_ecs_subnet            = var.cidr_block_ecs_subnet
  availability_zone_ecs_subnet     = var.availability_zone_ecs_subnet
  alb_listener_port                = var.alb_listener_port
  tags_alb_subnet_1                = var.tags_alb_subnet_1
  cidr_block_ecs_route_table       = var.cidr_block_ecs_route_table
  cidr_block_alb_subnet_1          = var.cidr_block_alb_subnet_1
  tags_alb_route_table             = var.tags_alb_route_table
  availability_zone_alb_subnet_2   = var.availability_zone_alb_subnet_2
  alb_type                         = var.alb_type
  cidr_block_alb_route_table       = var.cidr_block_alb_route_table
  availability_zone_rds_subnet_1   = var.availability_zone_rds_subnet_1
  cidr_block_alb_subnet_2          = var.cidr_block_alb_subnet_2
  instance_tenancy_main_vpc        = var.instance_tenancy_main_vpc
  availability_zone_rds_subnet_2   = var.availability_zone_rds_subnet_2
  enable_dns_support_main_vpc      = var.enable_dns_support_main_vpc
  tags_igw                         = var.tags_igw
  tags_rds_route_table             = var.tags_rds_route_table
  tags_nat_gateway                 = var.tags_nat_gateway
  tags_alb_subnet_2                = var.tags_alb_subnet_2
  tags_main_vpc                    = var.tags_main_vpc
  tags_alb                         = var.tags_alb
  cidr_block_main_vpc              = var.cidr_block_main_vpc
  cidr_block_rds_route_table       = var.cidr_block_rds_route_table
  tags_nat_eip                     = var.tags_nat_eip
  pub_alb_sg                       = module.security.alb_security_group
}

module "s3" {
  source                = "./s3"
  main_bucket_name      = var.main_bucket_name
  artifacts_bucket_name = var.artifacts_bucket_name
}

module "pipeline" {
  source                            = "./pipeline"
  ecs_cluster                       = module.ecs_service.cluster_name
  service_name                      = module.ecs_service.ecs_service_name
  s3_artifact_bucket_type           = var.s3_artifact_bucket_type
  s3_artifact_bucket                = module.s3.artifacts_bucket_name
  codepipeline_bucket               = module.s3.main_bucket_name
  codepipeline_role                 = module.iam.pipeline_iam_role_arn
  pipeline_name                     = var.pipeline_name
  pipeline_connection_name          = var.pipeline_connection_name
  pipeline_connection_provider_type = var.pipeline_connection_provider_type
  full_repository_id                = var.full_repository_id
  branch_name                       = var.branch_name
  source_output_artifacts           = var.source_output_artifacts
  build_output_artifacts            = var.build_output_artifacts
  build_namespace                   = var.build_namespace
  codebuild_project_name            = var.codebuild_project_name
  deploy_namespace                  = var.deploy_namespace
  source_namespace                  = var.source_namespace
}

module "cloudwatch" {
  source            = "./cloudwatch"
  log_group_name    = var.log_group_name
  retention_in_days = var.retention_in_days
}

module "rds" {
  source                                 = "./rds"
  aurorards_admin                        = var.aurorards_admin
  aurorards_cluster-sub_grp              = var.aurorards_cluster-sub_grp_name
  aurorards_deletion_protection          = var.aurorards_deletion_protection
  aurorards_cluster_identifier           = var.aurorards_cluster_identifier
  aurorards_storage_type                 = var.aurorards_storage_type
  aurorards_az_b                         = var.aurorards_az_b
  aurorards_preferred_backup_window      = var.aurorards_preferred_backup_window
  aurorards_publicly_accessible          = var.aurorards_publicly_accessible
  aurorards_preferred_maintenance_window = var.aurorards_preferred_maintenance_window
  aurorards_instance_class               = var.aurorards_instance_class
  aurorards_intance_count                = var.aurorards_intance_count
  aurorards_intance_identifier           = var.aurorards_intance_identifier
  aurorards_engine                       = var.aurorards_engine
  aurorards_engine_version               = var.aurorards_engine_version
  aurorards_admin_password               = var.aurorards_admin_password
  aurorards_intance_publicly_accessible  = var.aurorards_intance_publicly_accessible
  aurorards_backtrack_window             = var.aurorards_backtrack_window
  aurorards_storage_encrypted            = var.aurorards_storage_encrypted
  aurorards_az_a                         = var.aurorards_az_a
  aurorards_database_name                = var.aurorards_database_name
  aurorards_skip_final_snapshot          = var.aurorards_skip_final_snapshot
  pvt_subnet-rds_sub_1                   = module.network.pvt_subnet-rds_sub_1
  pvt_subnet-rds_sub_2                   = module.network.pvt_subnet-rds_sub_2
  rds_sg                                 = module.security.rds_security_group
}

module "security" {
  source             = "./security"
  pub_alb-sg         = var.pub_alb-sg
  ecs-sg             = var.ecs-sg
  rds-postgre_sql-sg = var.rds-postgre_sql-sg
  vpc_id             = module.network.vpc_id
  rds_sg_protocol = var.rds_sg_protocol
  rds_sg_from_port     = var.rds_sg_from_port
  rds_sg_to_port = var.rds_sg_to_port
  ecs_sg_protocol = var.ecs_sg_protocol
  ecs_sg_from_port     = var.ecs_sg_from_port
  ecs_sg_to_port = var.ecs_sg_to_port
  alb_sg_protocol = var.alb_sg_protocol
  alb_sg_from_port     = var.alb_sg_from_port
  alb_sg_to_port = var.alb_sg_to_port
  alb_sg_cidr_block     = var.alb_sg_cidr_block

}

module "waf" {
  source      = "./waf"
  waf         = var.waf
  pub_alb_arn = module.network.alb_arn
}