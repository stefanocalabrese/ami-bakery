<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->



## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| build_name | Name of the Project, same as the repository project folder | `string` | n/a |
| build_role_arn | IAM Role used by CodeBuild | `string` | n/a |
| cloudwatch_logs | Cloudwatch Log Group and Log Stream names | `map(any)` | n/a |
| description | Description of the pipeline and project | `string` | n/a |
| environment | Environment where the resource will be deployed | `string` | n/a |
| location | URL of the repository: https://github.com/username/REPOSITORY_NAME.git | `string` | n/a |
| private_subnets_ids | List of the subnets in the 3 Availability Zones | `list(any)` | n/a |
| security_groups_ids | List of the Security Groups where the temporary EC2 will be joined | `list(any)` | n/a |
| vpc_id | VPC ID where the resources will be created | `string` | n/a |
| artifacts | Configuration block for Artifacts produced. | `string` | `"NO_ARTIFACTS"` |
| build_timeout | Time in minutes for AWS CodeBuild to wait until timing out any related build that does not get marked as completed. Default is 60 minutes. | `number` | `60` |
| buildspec_file | Name of the buildSpec file used for creating AMI, can be in YAML or HCL. This file must be inside terraform/project_name/config-tools/buildspec/ | `string` | `""` |
| cache | Configuration block for cache. Default is 'NO_CACHE, it can be also 'LOCAL' or 'S3' | `string` | `"NO_CACHE"` |
| cloudwatch_logs_status | Enables or disables Cloudwatch Logs | `string` | `"ENABLED"` |
| codebuild_container_compute_type | Compute resources the build project will use | `string` | `"BUILD_GENERAL1_SMALL"` |
| codebuild_container_image | Docker image to use for this build project | `string` | `"aws/codebuild/standard:4.0"` |
| codebuild_container_type | Type of build environment to use for related builds | `string` | `"LINUX_CONTAINER"` |
| codebuild_image_pull_credentials_type | Type of credentials AWS CodeBuild uses to pull images in your build | `string` | `"CODEBUILD"` |
| component_packer_dir | Path where your Packer folder is. Usually 'terraform/project_name/config-tools/packer' | `string` | `""` |
| configuration_dir | Path where your Packer folder is. Usually 'terraform/project_name/config-tools' | `string` | `""` |
| encryption_disabled | Disables or enables encryption for logs on bucket, if enabled | `bool` | `false` |
| environment_variables | Custom environment variables that should be added or that will override default variables | `map(any)` | `{}` |
| filter_group_1 | Filter type for triggering webhook, defaults to 'EVENT' | `string` | `"EVENT"` |
| filter_group_2 | Filter type for triggering webhook, defaults to 'FILE_PATH' | `string` | `"FILE_PATH"` |
| git_clone_depth | Truncate git history to this many commits. Use 0 for a Full | `number` | `1` |
| insecure_ssl | Ignore SSL warnings when connecting to source control | `bool` | `false` |
| kms_arn | AWS KMS customer master key (CMK) to be used for encrypting the build project's build output artifacts. Defaults to empty (No encryption) | `string` | `""` |
| privileged_mode | (Optional) Whether to enable running the Docker daemon inside a Docker container. Defaults to false | `bool` | `false` |
| s3_logs_status | Enables or disables logs on S3 bucket | `string` | `"DISABLED"` |
| type | Type of repository that contains the source code to be built. Default is GITHUB | `string` | `"GITHUB"` |
| webhook_event | Filter for trigger, defalt is trigger Pipeline on a merged GitHub PR | `string` | `"PULL_REQUEST_MERGED"` |


## Modules

No modules.


## Requirements

| Name | Version |
|------|---------|
| terraform | 1.9.7 |
| aws | ~> 5.1.0 |


## Outputs

| Name | Description |
|------|-------------|
| arn | ARN of the Codebuild Project |
| name | Name of the Codebuild Project |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->