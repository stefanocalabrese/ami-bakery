variable "artifacts" {
  type        = string
  default     = "NO_ARTIFACTS"
  description = "Configuration block for Artifacts produced."
}

variable "build_name" {
  type        = string
  description = "Name of the Project, same as the repository project folder"
}

variable "build_role_arn" {
  type        = string
  description = "IAM Role used by CodeBuild"
}

variable "build_timeout" {
  type        = number
  default     = 60
  description = "Time in minutes for AWS CodeBuild to wait until timing out any related build that does not get marked as completed. Default is 60 minutes."
}

variable "buildspec_file" {
  type        = string
  default     = ""
  description = "Name of the buildSpec file used for creating AMI, can be in YAML or HCL. This file must be inside terraform/project_name/config-tools/buildspec/"
}

variable "cache" {
  type        = string
  default     = "NO_CACHE"
  description = "Configuration block for cache. Default is 'NO_CACHE, it can be also 'LOCAL' or 'S3'"
}

variable "cloudwatch_logs" {
  type        = map(any)
  description = "Cloudwatch Log Group and Log Stream names"
}

variable "cloudwatch_logs_status" {
  type        = string
  default     = "ENABLED"
  description = "Enables or disables Cloudwatch Logs"
}

variable "codebuild_container_compute_type" {
  type        = string
  default     = "BUILD_GENERAL1_SMALL"
  description = "Compute resources the build project will use"
}

variable "codebuild_container_image" {
  type        = string
  default     = "aws/codebuild/standard:4.0"
  description = "Docker image to use for this build project"
}

variable "codebuild_container_type" {
  type        = string
  default     = "LINUX_CONTAINER"
  description = "Type of build environment to use for related builds"
}

variable "codebuild_image_pull_credentials_type" {
  type        = string
  default     = "CODEBUILD"
  description = "Type of credentials AWS CodeBuild uses to pull images in your build"
}

variable "component_packer_dir" {
  type        = string
  default     = ""
  description = "Path where your Packer folder is. Usually 'terraform/project_name/config-tools/packer'"
}

variable "configuration_dir" {
  type        = string
  default     = ""
  description = "Path where your Packer folder is. Usually 'terraform/project_name/config-tools'"
}

variable "description" {
  type        = string
  description = "Description of the pipeline and project"
}

variable "encryption_disabled" {
  type        = bool
  default     = false
  description = "Disables or enables encryption for logs on bucket, if enabled"
}

variable "environment" {
  type        = string
  description = "Environment where the resource will be deployed"
}

variable "environment_variables" {
  type        = map(any)
  default     = {}
  description = "Custom environment variables that should be added or that will override default variables"
}

variable "filter_group_1" {
  type        = string
  default     = "EVENT"
  description = "Filter type for triggering webhook, defaults to 'EVENT'"
}

variable "filter_group_2" {
  type        = string
  default     = "FILE_PATH"
  description = "Filter type for triggering webhook, defaults to 'FILE_PATH'"
}

variable "git_clone_depth" {
  type        = number
  default     = 1
  description = "Truncate git history to this many commits. Use 0 for a Full"
}

variable "insecure_ssl" {
  type        = bool
  default     = false
  description = "Ignore SSL warnings when connecting to source control"
}

variable "kms_arn" {
  type        = string
  default     = ""
  description = "AWS KMS customer master key (CMK) to be used for encrypting the build project's build output artifacts. Defaults to empty (No encryption)"
}

variable "location" {
  type        = string
  description = "URL of the repository: https://github.com/username/REPOSITORY_NAME.git"
}

variable "subnets_ids" {
  type        = list(any)
  description = "List of the subnets in the 3 Availability Zones"
}

variable "privileged_mode" {
  type        = bool
  default     = false
  description = "(Optional) Whether to enable running the Docker daemon inside a Docker container. Defaults to false"
}

variable "s3_logs_status" {
  type        = string
  default     = "DISABLED"
  description = "Enables or disables logs on S3 bucket"
}

variable "security_groups_ids" {
  type        = list(any)
  description = "List of the Security Groups where the temporary EC2 will be joined"
}

variable "type" {
  type        = string
  default     = "GITHUB"
  description = "Type of repository that contains the source code to be built. Default is GITHUB"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where the resources will be created"
}

variable "webhook_event" {
  type        = string
  default     = "PULL_REQUEST_MERGED"
  description = "Filter for trigger, defalt is trigger Pipeline on a merged GitHub PR"
}
