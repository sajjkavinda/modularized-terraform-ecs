variable "pipeline_connection_name" {
  description = "value of the pipeline connection name"
}
variable "s3_artifact_bucket" {
  description = "value of the s3 artifact bucket"
}
variable "s3_artifact_bucket_type" {
  description = "value of the s3 artifact bucket type"
  default = "S3"
}
variable "source_output_artifacts" {
  description = "value of the source output artifacts"
}
variable "source_namespace" {
  description = "value of the source namespace"
}
variable "full_repository_id" {
  description = "value of the full repository id"
}
variable "branch_name" {
  description = "value of the branch name"
}
variable "build_output_artifacts" {
  description = "value of the build output artifacts"
}
variable "build_namespace" {
  description = "value of the build namespace"
}
variable "codebuild_project_name" {
  description = "value of the codebuild project name"
}
variable "pipeline_name" {
  description = "value of the pipeline name"
}
variable "deploy_namespace" {
  description = "value of the deploy namespace"
}
variable "pipeline_connection_provider_type" {
  description = "value of the pipeline connection provider type"
}
variable "ecs_cluster" {
  description = "value of the ecs cluster"
}
variable "service_name" {
  description = "value of the ecs service"
}
variable "codepipeline_bucket" {
  description = "value of the codepipeline bucket"
}
variable "codepipeline_role" {
  
}