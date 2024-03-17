resource "aws_iam_role" "ecs_execution-iam_role" { 
  name = var.ecs_execution-iam_role

  assume_role_policy = <<EOF
    {
    "Version": "2012-10-17",
    "Statement": [
    {
        "Action": "sts:AssumeRole",
        "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
    }
    ]
    }
    EOF
}

resource "aws_iam_policy" "ecs_execution-iam_policy" {
  name        = var.ecs_execution-iam_policy
  description = var.ecs_execution-iam_policy

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_execution-iam_role-policy-attachment" {
  role       = aws_iam_role.ecs_execution-iam_role.name
  policy_arn = aws_iam_policy.ecs_execution-iam_policy.arn
}

resource "aws_iam_policy" "codepipeline_policy" {
  name        = var.codepipeline-iam_policy
  description = var.codepipeline-iam_policy

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:GetObjectVersion",
          "s3:GetBucketVersioning",
          "s3:PutObjectAcl",
          "s3:PutObject",
        ]
        Effect   = "Allow"
        Resource = [
          "${var.codepipeline_bucket}/",
          "${var.codepipeline_bucket}/*"]
      },
    ]
    Statement = [
      {
        Effect = "Allow",
        Action = ["codestar-connections:UseConnection"]
        Resource = ["${var.codestar_connection_arn}"]
      }
    ]
    Statement = [
      {
        Effect = "Allow",
        Action = ["codebuild:BatchGetBuilds",
                  "codebuild:StartBuild",]
        Resource = ["*"]
      }
    ]
  })
}

resource "aws_iam_role" "codepipeline_role" {
  name               = var.pipeline_iam_role_name
  assume_role_policy = <<EOF
    {
    "Version": "2012-10-17",
    "Statement": [
    {
        "Action": "sts:AssumeRole",
        "Principal": {
        "Service": "codepipeline.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
    }
    ]
    }
    EOF
}

resource "aws_iam_role_policy_attachment" "codepipeline-iam_role-policy-attachment" {
  role       = aws_iam_role.codepipeline_role.name
  policy_arn = aws_iam_policy.codepipeline_policy.arn
}


