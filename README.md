Terraform Modules Usage and Overview

This document provides an overview and usage guide for the Terraform modules available in this repository. Each module serves a specific purpose and can be utilized independently or in combination with others to build a comprehensive AWS infrastructure setup.

Root Module

The root module serves as the entry point for configuring and deploying resources using Terraform. It orchestrates the integration of various modules to create a cohesive AWS environment.

To use the root module:

- Clone or download the repository to your local machine.
- Configure the Variables.tf and terraform.tfvars files within the root module to  the desired configuration parameters.
- Execute terraform init to initialize the Terraform environment.
- Execute terraform plan to preview the changes that will be applied.
- Execute terraform apply to apply the changes and provision the AWS resources.

Modules Overview

CloudWatch Module
The CloudWatch module enables the creation of log groups and retention policies for centralized log management.

Usage:

module "cloudwatch" {
  source = "./modules/cloudwatch"

  #  Variables for CloudWatch module 
}

ECS Service Module
The ECS Service module facilitates the configuration of ECS clusters, services, task definitions, and related resources.

Usage:

module "ecs_service" {
  source = "./modules/ecs_service"

  #  Variables for ECS Service module 
}

Task Definition Module
The Task Definition module provides a template for defining ECS task definitions with container configurations.

Usage:

module "task_definition" {
  source = "./modules/task_definition"

  #  Variables for Task Definition module 
}

Pipeline Module
The Pipeline module automates the setup of CI/CD pipelines for continuous integration and continuous deployment.

Usage:

module "pipeline" {
  source = "./modules/pipeline"

  #  Variables for Pipeline module 
}

IAM Module
The IAM module manages IAM roles, policies, and permissions required for various AWS services.

Usage:

module "iam" {
  source = "./modules/iam"

  #  Variables for IAM module 
}

S3 Module
The S3 module handles the creation and configuration of S3 buckets for object storage.

Usage:

module "s3" {
  source = "./modules/s3"

  #  Variables for S3 module 
}

RDS Module
The RDS module automates the provisioning of relational database services on AWS.

Usage:

module "rds" {
  source = "./modules/rds"

  #  Variables for RDS module 
}

Network Module
The Network module manages the setup of VPCs, subnets, route tables, and related networking components.

Usage:

module "network" {
  source = "./modules/network"

  #  Variables for Network module 
}

WAF Module
The WAF module configures AWS Web Application Firewall to protect web applications from common web exploits.

Usage:

module "waf" {
  source = "./modules/waf"

  #  Variables for WAF module 
}

Security Module
The Security module handles the setup of security-related resources such as security groups and IAM policies.

Usage:

module "security" {
  source = "./modules/security"

  #  Variables for Security module 
}

Terraform Configuration

This document provides guidance on configuring the Terraform Variables for setting up various resources on AWS. Make sure to fill in the values according to your specific requirements before applying the Terraform configuration.

ECS Configuration
Cluster Configuration

cluster_name: Enter the name for your ECS cluster.
launch_type:  the launch type for your ECS cluster.
private-subnet: Select the private subnet w ECS instances will be deployed.
sg_ecs:  the security group for ECS instances.
desired_count: Define the desired count of ECS tasks.
tg:  the target group for ECS tasks.

Task Definition Configuration

task_definition: Enter the name of your task definition.
ecs_task_execution_role_policy:  the policy for ECS task execution role.
ecs_execution-iam_role_name: Define the IAM role name for ECS execution.
ecs_execution-iam_role-policy-attachment: Enter the policy attachment for ECS execution IAM role.
ecs_execution-iam_policy:  the IAM policy for ECS execution.

Network Configuration

VPC Configuration

cidr_block_main_vpc:  the CIDR block for the main VPC.
instance_tenancy_main_vpc: Define the instance tenancy for the main VPC.
enable_dns_support_main_vpc: Enable DNS support for the main VPC.
enable_dns_hostnames_main_vpc: Enable DNS hostnames for the main VPC.
aws_region:  the AWS region.
tags_main_vpc: Enter tags for the main VPC.
Internet Gateway Configuration
tags_igw: Define tags for the Internet Gateway.

Subnets Configuration

RDS Subnets

cidr_block_rds_subnet_1:  the CIDR block for the RDS subnet.
availability_zone_rds_subnet_1: Define the availability zone for the RDS subnet.
tags_rds_subnet_1: Enter tags for the RDS subnet.

Application Load Balancer (ALB) Subnets

cidr_block_alb_subnet_1:  the CIDR block for the ALB subnet.
availability_zone_alb_subnet_1: Define the availability zone for the ALB subnet.
tags_alb_subnet_1: Enter tags for the ALB subnet.

ECS Subnet

cidr_block_ecs_subnet:  the CIDR block for the ECS subnet.
availability_zone_ecs_subnet: Define the availability zone for the ECS subnet.
tags_ecs_subnet: Enter tags for the ECS subnet.
Route Tables

tags_alb_route_table: Define tags for the ALB route table.
tags_ecs_route_table: Enter tags for the ECS route table.
tags_rds_route_table:  tags for the RDS route table.

Application Load Balancer Configuration

alb_name: Enter the name for the Application Load Balancer (ALB).
alb_type:  the type of ALB.
alb_internal: Define whether ALB is internal (true/false).
public_alb_enable_deletion_protection:  deletion protection for the public ALB.
tags_alb: Enter tags for the ALB.

Target Groups Configuration

target_group_name:  the name for the target group.
target_group_port: Define the port for the target group.
target_group_protocol:  the protocol for the target group.
target_group_target_type: Define the target type for the target group.
target_group_tags: Enter tags for the target group.

Listener Configuration

alb_listener_port:  the port for the listener.
alb_listener_protocol: Define the protocol for the listener.
alb_listener_default_action_type:  the default action type for the listener.

Listener Rule Configuration

listener_rule_priority:  the priority for the listener rule.
listener_rule_action_type: Define the action type for the listener rule.
listener_rule_condition_path_pattern:  the condition path pattern for the listener rule.
listener_rule_condition_host_header: Define the condition host header for the listener rule.

S3 Configuration

main_bucket_name:  the name for the main S3 bucket.
artifacts_bucket_name: Enter the name for the artifacts S3 bucket.

CloudWatch Configuration

log_group_name: Define the name for the CloudWatch log group.
retention_in_days:  the retention period for the log events in the log group.

Aurora RDS Configuration

aurorards_admin:  the database administrator username.
aurorards_admin_password: Define the database administrator password.
aurorards_az_a:  the availability zone A for the RDS cluster.
aurorards_az_b: Define the availability zone B for the RDS cluster.
aurorards_cluster_identifier: Enter the cluster identifier for Aurora RDS.
aurorards_engine:  the engine for Aurora RDS.
aurorards_engine_version: Define the engine version for Aurora RDS.
aurorards_database_name:  the database name for Aurora RDS.
aurorards_storage_type: Define the storage type for Aurora RDS.
aurorards_backtrack_window:  the backtrack window for Aurora RDS.
aurorards_preferred_backup_window: Define the preferred backup window for Aurora RDS.
aurorards_preferred_maintenance_window:  the preferred maintenance window for Aurora RDS.
aurorards_storage_encrypted: Define whether storage is encrypted for Aurora RDS.
aurorards_skip_final_snapshot:  whether to skip the final snapshot for Aurora RDS.
aurorards_deletion_protection: Define whether deletion protection is enabled for Aurora RDS.
aurorards_publicly_accessible:  whether Aurora RDS is publicly accessible.
aurorards_intance_publicly_accessible: Define whether instance is publicly accessible for Aurora RDS.
aurorards_intance_count:  the instance count for Aurora RDS.
aurorards_intance_identifier: Define the instance identifier for Aurora RDS.
aurorards_instance_class:  the instance class for Aurora RDS.
aurorards_cluster-sub_grp_name: Define the subnet group for Aurora RDS.

ALB Security Groups Configuration

pub_alb-sg:  the security group for ALB.
ecs-sg: Define the security group for ECS.
rds-postgre_sql-sg:  the security group for RDS PostgreSQL.

WAF Configuration

waf: Define the Web Application Firewall.