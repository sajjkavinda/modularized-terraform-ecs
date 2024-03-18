# Common Variables
cluster_name                              = "my-ecs-cluster"
service_name                              = "service-frontend-1"
task_definition                           = "task-def-fe-1"
container_name                            = "container-fe-1"
container_port                            = 80
deployment_minimum_healthy_percent        = 50
deployment_maximum_percent                = 200
launch_type                               = "EC2"
desired_count                             = 2
ecs_task_execution_role                   = "ecs-task-execution-role"
ecs_task_execution_role_policy            = "ecs-task-execution-role-policy"
ecs_execution-iam_role_name               = "ecs-execution-iam-role"
ecs_execution-iam_policy                  = "ecs-execution-iam-policy"

# Network Variables
cidr_block_main_vpc           = "172.18.0.0/16"
instance_tenancy_main_vpc     = "default"
enable_dns_support_main_vpc   = "true"
enable_dns_hostnames_main_vpc = "true"
aws_region                    = "ap-southeast-1"
tags_main_vpc = {
Name = "nonp-soms_v2-apse1-vpc-main" }

tags_igw = { Name = "nonp-soms_v2-apse1-igw" }


#################################################################################################
###                                            Subnets                                        ###
#################################################################################################
############## RDS - Subnets ##############

cidr_block_rds_subnet_1        = "172.18.4.0/25"
availability_zone_rds_subnet_1 = "ap-southeast-1a"
tags_rds_subnet_1 = {
Name = "nonp-soms_v2-apse1-pvt_subnet-rds_sub_1" }

cidr_block_rds_subnet_2        = "172.18.5.0/25"
availability_zone_rds_subnet_2 = "ap-southeast-1b"
tags_rds_subnet_2 = {
Name = "nonp-soms_v2-apse1-pvt_subnet-rds_sub_2" }


############## ALB - Subnet ##############
cidr_block_alb_subnet_1        = "172.18.1.0/25"
availability_zone_alb_subnet_1 = "ap-southeast-1a"
tags_alb_subnet_1 = {
  Name = "nonp-soms_v2-apse1-pub_subnet-alb_sub"
}

cidr_block_alb_subnet_2        = "172.18.2.0/25"
availability_zone_alb_subnet_2 = "ap-southeast-1b"
tags_alb_subnet_2 = {
  Name = "nonp-soms_v2-apse1-pub_subnet-alb_sub_2"
}


############## NAT - Subnet ##############
tags_nat_eip = {
  Name = "nonp-soms_v2-apse1-natgw_eip"
}

tags_nat_gateway = {
  Name = "nonp-soms_v2-apse1-pub_subnet-natgw"
}

############## ECS - Subnet ##############
cidr_block_ecs_subnet        = "172.18.3.0/24"
availability_zone_ecs_subnet = "ap-southeast-1a"
tags_ecs_subnet = {
  Name = "nonp-soms_v2-apse1-pvt_subnet-ecs"
}

#################################################################################################
###                                    Rout Tables                                            ###
#################################################################################################

############## ALB - RT ##############
cidr_block_alb_route_table = "0.0.0.0/0"
tags_alb_route_table       = { Name = "nonp-soms_v2-apse1-alb_pub-rt" }

############## ECS - RT ##############
cidr_block_ecs_route_table = "0.0.0.0/0"
tags_ecs_route_table = {
Name = "nonp-soms_v2-apse1-ecs-pvt_rt" }



############## RDS - RT ##############
cidr_block_rds_route_table = "0.0.0.0/0"
tags_rds_route_table = {
  Name = "nonp-soms_v2-apse1-rds_psql-pvt_rt_1"
}


#################################################################################################
###                                          ALB                                              ###
#################################################################################################

################# ALB ####################

alb_name                              = "nonp-somsv2-apse1-pub-alb"
alb_internal                          = false
alb_type                              = "application"
public_alb_enable_deletion_protection = true
tags_alb                              = { Name = "nonp-somsv2-apse1-pub-alb" }

################# TG-fe1########################

target_group_name        = "nonp-somsv2-apse1-fe1-alb-tg"
target_group_port        = 8080
target_group_protocol    = "HTTP"
target_group_target_type = "ip"
target_group_tags        = { Name = "nonp-somsv2-apse1-fe1-alb-tg" }

################# Listner-Rule ########################

alb_listener_port     = 80
alb_listener_protocol = "HTTP"
# alb_listener_certificate_arn     = ""
alb_listener_default_action_type = "forward"

#Listner fe1 rule
listener_rule_priority               = 104
listener_rule_action_type            = "forward"
listener_rule_condition_path_pattern = "/**"
listener_rule_condition_host_header  = "dev-soms-v2.mitesp.com"

# S3 Variables
main_bucket_name      = "soms-test-bucket"
artifacts_bucket_name = "soms-artifacts-bucket"

# Task Definition Variables
task_definition_family   = "task-def-fe-1"
network_mode             = "awsvpc"
requires_compatibilities = ["EC2"]
task_cpu                 = 256
task_memory              = 512
ecr_image                = "ecr-repo/image-fe-1:latest"
ecr_image_data           = "fe-1-image-data"
container_cpu            = 256
container_memory         = 512
port_mappings            = [{ hostPort = 80, containerPort = 80, protocol = "tcp" }]
log_driver               = "awslogs"
awslogs_group            = "ecs-logs"
awslogs_region           = "us-east-1"
awslogs_stream_prefix    = "fe-1"

# Pipeline Variables
pipeline_connection_name          = "soms-pipeline-connection"
s3_artifact_bucket_type           = "S3"
source_output_artifacts           = ["source-output-fe-1"]
source_namespace                  = "SourceNamespaceFe1"
full_repository_id                = "my/ecr/repo/fe-1"
branch_name                       = "main"
build_output_artifacts            = ["build-output-fe-1"]
build_namespace                   = "BuildNamespaceFe1"
codebuild_project_name            = "codebuild-fe-1"
pipeline_name                     = "soms-pipeline-fe-1"
deploy_namespace                  = "DeployNamespaceFe1"
pipeline_connection_provider_type = "Bitbucket"
pipeline_iam_role_name            = "soms-pipeline-iam-role"
codepipeline-iam_policy           = "codepipeline-iam-policy"


# Cloudwatch Variables
log_group_name    = "/ecs/my-ecs-cluster-logs"
retention_in_days = 7

#RDS

aurorards_cluster_identifier           = "nonp-somsv2-apse1-rds-postgres-cluster"
aurorards_engine                       = "aurora-postgresql"
aurorards_engine_version               = "16.1"
aurorards_database_name                = "nonp_somsv2_apse1_rds_postgres_cluster"
aurorards_storage_type                 = "aurora"
aurorards_backtrack_window             = 0
aurorards_preferred_backup_window      = "21:30-22:00"
aurorards_preferred_maintenance_window = "Sat:20:30-Sat:21:00"
aurorards_storage_encrypted            = true
aurorards_skip_final_snapshot          = true
aurorards_deletion_protection          = true
aurorards_publicly_accessible          = true
aurorards_intance_publicly_accessible  = true
aurorards_intance_count                = 1
aurorards_intance_identifier           = "nonp-somsv2-apse1-rds-postgres-cluster"
aurorards_instance_class               = "db.r6g.large"
aurorards_cluster-sub_grp_name         = "nonp-soms_v2-apse1-rds-postgres_cluster-sub_grp"
aurorards_az_a                         = "ap-southeast-1a"
aurorards_az_b                         = "ap-southeast-1b"
aurorards_admin                        = ""
aurorards_admin_password               = ""

#Security
pub_alb-sg         = "nonp-soms_v2-apse1-pub_alb-sg"
ecs-sg             = "nonp-soms_v2-apse1-ecs-sg"
rds-postgre_sql-sg = "nonp-soms_v2-apse1-rds-sg"
alb_sg_cidr_block = ""
alb_sg_from_port = 80
alb_sg_to_port = 80
alb_sg_protocol = "tcp"
ecs_sg_from_port =  80
ecs_sg_to_port = 80
ecs_sg_protocol = "tcp"
rds_sg_from_port = 5432
rds_sg_to_port = 5432
rds_sg_protocol = "tcp"
#WAF

waf = "nonp-soms_v2-apse1-waf"
