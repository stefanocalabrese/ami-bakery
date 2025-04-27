locals {
  build_name = var.build_name

  default_env_vars = {
    PROJECT_NAME         = var.build_name
    ENVIRONMENT          = var.environment
    COMPONENT_PACKER_DIR = var.component_packer_dir
    CONFIGURATION_DIR    = var.configuration_dir
  }
}

resource "aws_codebuild_project" "codebuild" {
  name          = local.build_name
  description   = var.description
  build_timeout = var.build_timeout
  service_role  = var.build_role_arn

  source {
    type            = var.type
    insecure_ssl    = var.insecure_ssl
    location        = var.location
    buildspec       = var.buildspec_file
    git_clone_depth = var.git_clone_depth
  }

  artifacts {
    type = var.artifacts
  }

  cache {
    type = var.cache
  }

  vpc_config {
    vpc_id             = var.vpc_id
    subnets            = var.subnets_ids
    security_group_ids = var.security_groups_ids
  }

  environment {
    type                        = var.codebuild_container_type
    image                       = var.codebuild_container_image
    compute_type                = var.codebuild_container_compute_type
    privileged_mode             = var.privileged_mode
    image_pull_credentials_type = var.codebuild_image_pull_credentials_type

    dynamic "environment_variable" {
      for_each = merge(local.default_env_vars, var.environment_variables)
      content {
        name  = environment_variable.key
        value = environment_variable.value
      }
    }
  }

  logs_config {
    cloudwatch_logs {
      status      = var.cloudwatch_logs_status
      group_name  = var.cloudwatch_logs["group_name"]
      stream_name = var.cloudwatch_logs["stream_name"]
    }

    s3_logs {
      status              = var.s3_logs_status
      encryption_disabled = var.encryption_disabled
    }
  }

  encryption_key = var.kms_arn
}


resource "aws_codebuild_webhook" "codebuild_webhook" {
  project_name = aws_codebuild_project.codebuild.name

  filter_group {
    filter {
      type    = var.filter_group_1
      pattern = var.webhook_event
    }

    filter {
      type    = var.filter_group_2
      pattern = "${var.configuration_dir}/*"
    }
  }
}
