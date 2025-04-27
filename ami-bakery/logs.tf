resource "aws_cloudwatch_log_group" "packer" {
  name              = "codebuild/${local.build_name}"
  retention_in_days = 7

  tags = {
    environment = var.environment
    group       = local.build_name
  }
}
