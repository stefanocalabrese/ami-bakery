resource "aws_codebuild_source_credential" "codebuild_gh_token" {
 auth_type   = "PERSONAL_ACCESS_TOKEN"
 server_type = "GITHUB"
 token       = jsondecode(data.aws_secretsmanager_secret_version.codebuild.secret_string)["gh_token"]
}

resource "aws_cloudwatch_log_group" "golden_ami" {
 name              = "codebuild/${local.build_name}"
 retention_in_days = 7

 tags = {
   environment = var.environment
   group       = local.build_name
 }
}

resource "aws_security_group" "packer_sg" {
  name        = "packer-sg"
  description = "Security group for Packer allowing SSH within the VPC"
  vpc_id      = data.aws_vpc.vpc.id

  # Inbound rule: Allow SSH from inside the VPC CIDR block
  ingress {
    description      = "Allow SSH from within the VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [data.aws_vpc.vpc.cidr_block]
  }

  # Outbound rule: Allow everything
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"          # All protocols
    cidr_blocks = ["0.0.0.0/0"] # You can go everywhere out
  }

  tags = {
    Name  = "packer-sg"
    Scope = "Temporary EC2 used by Codebuild to bake the AMI"
  }
}

module "golden_ami" {
 source         = "../codebuild/"
 build_name     = local.build_name
 description    = "${local.build_name}-${local.year_month_date}"
 environment    = var.environment
 location       = local.repository_url
 build_role_arn = data.aws_iam_role.codebuild.arn

 # kms_arn        = aws_kms_key.kms_key.arn  # Uncomment if you want to use KMS encryption, you need to create a KMS

 configuration_dir    = local.config_dir
 component_packer_dir = "${local.config_dir}/packer"
 buildspec_file       = file("${path.module}/config-tools/buildspecs/buildspec.yml")
 build_timeout        = local.build_timeout

 codebuild_container_image        = local.codebuild_container_image
 codebuild_container_compute_type = local.codebuild_container_compute_type

 vpc_id              = data.aws_vpc.vpc.id
 private_subnets_ids = data.aws_subnets.private_subnets.ids
 security_groups_ids = [aws_security_group.packer_sg.id]

 cloudwatch_logs = {
   group_name  = aws_cloudwatch_log_group.golden_ami_windows.id
   stream_name = local.build_name
 }

 environment_variables = {
   BOOTSTRAP_BUCKET = "s3-bootstrap"
   SNS_TOPIC_ARN    = "arn:aws:sns:eu-central-1:${data.aws_caller_identity.current.account_id}:email-infra-notifications"
   DATE             = local.date
   SSH_KEY_NAME     = local.project_name
 }
}
