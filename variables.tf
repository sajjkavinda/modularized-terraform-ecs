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
variable "desired_count" {
  description = "value of the desired count"
}

variable "ecs_task_execution_role_policy" {
  description = "value of the ecs task execution role policy"
}
variable "ecs_execution-iam_role_name" {
  description = "value of the ecs execution iam role name"
}
variable "ecs_execution-iam_policy" {
  description = "value of the ecs execution iam policy"
}

# Network
#################################################################################################
###                                              VPC                                          ###
#################################################################################################

variable "cidr_block_main_vpc" {
  description = "cidr block of the main VPC"
}

variable "instance_tenancy_main_vpc" {
  description = "instance tenancy of the main VPC"
}
variable "enable_dns_support_main_vpc" {
  description = "enable dns support of the main VPC"
}
variable "enable_dns_hostnames_main_vpc" {
  description = "enable dns hostnames of the main VPC"
}
variable "aws_region" {
  description = "aws region"
}
variable "tags_main_vpc" {
  description = "tags of the main VPC"
}

#################################################################################################
###                                            IGW                                            ###
#################################################################################################

variable "tags_igw" {
  description = "tags of the internet gateway"
}

#################################################################################################
###                                            Subnets                                        ###
#################################################################################################

############## RDS - Subnets ##############
variable "cidr_block_rds_subnet_1" {
  description = "cidr block of the rds subnet"
}
variable "availability_zone_rds_subnet_1" {
  description = "availability zone of the rds subnet"
}
variable "tags_rds_subnet_1" {
  description = "tags of the rds subnet"
}
#rds subnet 2
variable "cidr_block_rds_subnet_2" {
  description = "cidr block of the rds subnet"
}
variable "availability_zone_rds_subnet_2" {
  description = "availability zone of the rds subnet"
}
variable "tags_rds_subnet_2" {
  description = "tags of the rds subnet"
}

#alb subnet 1
variable "cidr_block_alb_subnet_1" {
  description = "cidr block of the alb subnet"
}
variable "availability_zone_alb_subnet_1" {
  description = "availability zone of the alb subnet"
}
variable "tags_alb_subnet_1" {
  description = "tags of the alb subnet"
}
#alb subnet 2
variable "cidr_block_alb_subnet_2" {
  description = "cidr block of the alb subnet"
}
variable "availability_zone_alb_subnet_2" {
  description = "availability zone of the alb subnet"
}
variable "tags_alb_subnet_2" {
  description = "tags of the alb subnet"
}

#nat subnet eip
variable "tags_nat_eip" {
  description = "tags of the nat eip"
}

#aws nat gateway
variable "tags_nat_gateway" {
  description = "tags of the nat eip"
}


#ecs subnet 
variable "cidr_block_ecs_subnet" {
  description = "cidr block of the ecs subnet"
}
variable "availability_zone_ecs_subnet" {
  description = "availability zone of the ecs subnet"
}
variable "tags_ecs_subnet" {
  description = "tags of the ecs subnet"
}

#route tables 
#alb route table 
variable "tags_alb_route_table" {
  description = "tags of the alb route table"
}
variable "cidr_block_alb_route_table" {
  description = "cidr block of the ecs subnet"
}

#ecs route table
variable "tags_ecs_route_table" {
  description = "tags of the ecs route table"
}
variable "cidr_block_ecs_route_table" {
  description = "cidr block of the ecs subnet"
}
#rds route table
variable "tags_rds_route_table" {
  description = "tags of the rds route table"
}
variable "cidr_block_rds_route_table" {
  description = "cidr block of the ecs subnet"
}

#Application Load balancer
variable "alb_name" {
  description = "name of the alb"
}
variable "alb_type" {
  description = "type of the alb"
}
variable "alb_internal" {
  description = "internal or not of the alb : true or false"
}
variable "public_alb_enable_deletion_protection" {
  description = "deletion protection of the alb : true or false"
}

variable "tags_alb" {
  description = "tags of the alb"
}


#target groups
#target group fe1

variable "target_group_name" {
  description = "name of the target group"
}
variable "target_group_port" {
  description = "port of the target group"
}

variable "target_group_protocol" {
  description = "protocol of the target group"

}
variable "target_group_target_type" {
  description = "target type of the target group"
}
variable "target_group_tags" {
  description = "tags of the target group"
}


# Listner
variable "alb_listener_port" {
  description = "port of the listener"
}
variable "alb_listener_protocol" {
  description = "protocol of the listener"
}
# variable "alb_listener_certificate_arn" {
#   description = "certificate of the listener"
# }
variable "alb_listener_default_action_type" {
}

#listner fe1 rule
variable "listener_rule_priority" {
  description = "priority of the listener"
}
variable "listener_rule_action_type" {
  description = "action type of the listener"
}
variable "listener_rule_condition_path_pattern" {
  description = "condition path pattern of the listener"
}
variable "listener_rule_condition_host_header" {
  description = "condition host header of the listener"
}

variable "main_bucket_name" {
  description = "main s3"
  type        = string
}
variable "artifacts_bucket_name" {
  description = "artifacts s3"
  type        = string
}

# Task Definition

variable "task_definition_family" {
  description = "value of the task definition family"
}
variable "network_mode" {
  description = "value of the network mode"
}
variable "requires_compatibilities" {
  description = "value of the requires compatibilities"
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
# Pipeline

# variable "s3_artifact_bucket" {
#   description = "value of the s3 artifact bucket"
# }
variable "s3_artifact_bucket_type" {
  description = "value of the s3 artifact bucket type"
}

variable "source_namespace" {
  description = "value of the source namespace"
}
variable "branch_name" {
  description = "value of the branch name"
}
variable "build_namespace" {
  description = "value of the build namespace"
}
variable "pipeline_name" {
  description = "value of the pipeline name"
}
variable "pipeline_connection_provider_type" {
  description = "value of the pipeline connection provider type"
}
# variable "service_name" {
#   description = "value of the ecs service"
# }
# variable "iam_role_name" {
#   description = "value of the iam role name"
# }

variable "pipeline_iam_role_name" {
  description = "value of the iam role name"
}
variable "codepipeline-iam_policy" {
  description = "value of the codepipeline iam policy"
}

variable "pipeline_connection_name" {
  description = "value of the pipeline connection name"
}

variable "source_output_artifacts" {
  description = "value of the source output artifacts"
}
variable "full_repository_id" {
  description = "value of the full repository id"
}
variable "build_output_artifacts" {
  description = "value of the build output artifacts"
}
variable "codebuild_project_name" {
  description = "value of the codebuild project name"
}
variable "deploy_namespace" {
  description = "value of the deploy namespace"
}
# variable "ecs_cluster" {
#   description = "value of the ecs cluster"
# }
# variable "codepipeline_bucket" {
#   description = "value of the codepipeline bucket"
# }
# Cloudwatch

variable "log_group_name" {
  description = "The name of the log group"
  type        = string
}
variable "retention_in_days" {
  description = "The number of days to retain the log events in the log group"
  type        = number
}

variable "aurorards_admin" {
  description = "Database administrator username"
  type        = string
  sensitive   = true
}


variable "aurorards_admin_password" {
  description = "Database administrator password"
  type        = string
  sensitive   = true
}

variable "aurorards_az_a" {
  description = "Cluster az a"
  type        = string

}

variable "aurorards_az_b" {
  description = "Cluster az b"
  type        = string

}

variable "aurorards_cluster_identifier" {
  description = "Cluster Identifier"
  type        = string

}

variable "aurorards_engine" {
  description = "Cluster engine"
  type        = string

}

variable "aurorards_engine_version" {
  description = "Cluster engine version"
  type        = string

}

variable "aurorards_database_name" {
  description = "Cluster database name"
  type        = string

}

variable "aurorards_storage_type" {
  description = "Cluster database storage type"
  type        = string

}

variable "aurorards_backtrack_window" {
  description = "Cluster database backtrack"
  type        = string

}

variable "aurorards_preferred_backup_window" {
  description = "Cluster preferred backup window"
  type        = string

}

variable "aurorards_preferred_maintenance_window" {
  description = "Cluster preferred maintenance window"
  type        = string

}

variable "aurorards_storage_encrypted" {
  description = "Cluster storage encrypted"
  type        = string

}

variable "aurorards_skip_final_snapshot" {
  description = "Cluster skip final snapshot"
  type        = string

}

variable "aurorards_deletion_protection" {
  description = "Cluster deletion protection"
  type        = string

}

variable "aurorards_publicly_accessible" {
  description = "Cluster publicly accessible"
  type        = string

}

variable "aurorards_intance_publicly_accessible" {
  description = "Intance publicly accessible"
  type        = string

}

variable "aurorards_intance_count" {
  description = "Intance count"
  type        = string

}

variable "aurorards_intance_identifier" {
  description = "Intance identifier"
  type        = string

}

variable "aurorards_instance_class" {
  description = "Intance instance class"
  type        = string

}

variable "aurorards_cluster-sub_grp_name" {
  description = "Cluster subnet group"
  type        = string

}

## SG ##

variable "pub_alb-sg" {
  description = "alb sec group"
}

variable "ecs-sg" {
  description = "ecs sec group"
}

variable "rds-postgre_sql-sg" {
  description = "rds sec group"
}

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

variable "waf" {
  description = "soms-wafv2"

}