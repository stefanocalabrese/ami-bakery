output "name" {
 value       = aws_codebuild_project.codebuild.name
 description = "Name of the Codebuild Project"
}

output "arn" {
 value       = aws_codebuild_project.codebuild.arn
 description = "ARN of the Codebuild Project"
}
