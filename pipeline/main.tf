resource "aws_codepipeline" "pipeline" {
  name     = var.pipeline_name
  role_arn = var.codepipeline_role

  artifact_store {
    location = var.s3_artifact_bucket
    type     = var.s3_artifact_bucket_type
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = var.source_output_artifacts
      namespace = var.source_namespace


      configuration = {
        ConnectionArn    = aws_codestarconnections_connection.pipeline-connection.arn
        FullRepositoryId = var.full_repository_id
        BranchName       = var.branch_name
        DetectChanges    = false
        OutputArtifactFormat = "CODE_ZIP"

      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = var.source_output_artifacts
      output_artifacts = var.build_output_artifacts
      version          = "1"
      namespace = var.build_namespace


      configuration = {
        ProjectName = var.codebuild_project_name
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "ECS"
      input_artifacts = var.build_output_artifacts
      version         = "1"
      namespace = var.deploy_namespace

      configuration = {
        ClusterName = var.ecs_cluster
        ServiceName = var.service_name

      }
    }
  }
  depends_on = [ var.codepipeline_role ]
}

resource "aws_codestarconnections_connection" "pipeline-connection" {
  name          = var.pipeline_connection_name
  provider_type = var.pipeline_connection_provider_type
}