output "devops_role_arn" {
  description = "The ARN of the DevOps role"
  value       = aws_iam_role.devops_role.arn
}

output "project_lead_role_arn" {
  description = "The ARN of the Project Lead role"
  value       = aws_iam_role.project_lead_role.arn
}
