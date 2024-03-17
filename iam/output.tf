output "task_execution_role" {
  value = aws_iam_role.ecs_execution-iam_role
}
output "ecs_task_execution_role_policy" {
  value = aws_iam_policy.ecs_execution-iam_policy
}
output "task_execution_role_attachment" {
  value = aws_iam_role_policy_attachment.ecs_execution-iam_role-policy-attachment
}
output "pipeline_iam_role_name" {
  value = aws_iam_role.codepipeline_role.name
}
output "pipeline_iam_role_arn" {
  value = aws_iam_role.codepipeline_role.arn
}
output "codepipeline-iam_policy" {
  value = aws_iam_policy.codepipeline_policy
}