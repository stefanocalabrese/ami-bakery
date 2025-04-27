resource "aws_codebuild_source_credential" "codebuild_gh_token" {
  auth_type   = "PERSONAL_ACCESS_TOKEN"
  server_type = "GITHUB"
  token       = jsondecode(aws_secretsmanager_secret_version.github_token_version.secret_string)["gh_token"]
}



module "golden_ami" {
  source         = "../codebuild/"
  build_name     = local.build_name
  description    = "${local.build_name}-${local.year_month_date}"
  environment    = var.environment
  location       = local.repository_url
  build_role_arn = data.aws_iam_role.codebuild.arn

  # kms_arn = aws_kms_key.kms_key.arn  # Uncomment if you want to use KMS encryption, you need to create a KMS

  configuration_dir    = local.config_dir
  component_packer_dir = "${local.config_dir}/packer"
  buildspec_file       = file("${local.config_dir}/buildspecs/buildspec.yaml")
  build_timeout        = local.build_timeout

  codebuild_container_image        = local.codebuild_container_image
  codebuild_container_compute_type = local.codebuild_container_compute_type

  vpc_id              = data.aws_vpc.vpc.id
  private_subnets_ids = data.aws_subnets.subnets.ids
  security_groups_ids = [aws_security_group.packer_sg.id]

  cloudwatch_logs = {
    group_name  = aws_cloudwatch_log_group.packer.id
    stream_name = local.build_name
  }

  environment_variables = {
    BOOTSTRAP_BUCKET = aws_s3_bucket.bakery_store.id
    SNS_TOPIC_ARN    = aws_sns_topic.notification_email_topic.arn
    DATE             = local.date
    SSH_KEY_NAME     = local.project_name
  }
}
