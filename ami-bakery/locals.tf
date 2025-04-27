locals {
  # >>>>>>> IMPORTANT!!! <<<<<< 
  # The "project_name" needs to be the same name of the project folder in the repository or the build will fail!!!
  project_name = "ami-bakery"

  repository_url  = "https://github.com/stefanocalabrese/ami-bakery.git" # Change this if you fork the repository to customize it
  build_name      = "windows-server-2022-golden-ami-${local.year_month_date}"
  config_dir      = "./${local.project_name}/config-tools"
  date            = formatdate("YYYYMMDDHHMM", timestamp())
  year_month_date = formatdate("YYYY-MM-DD", timestamp())

  build_timeout                    = 300                          # 5 Minutes, increase it at your needs
  codebuild_container_image        = "aws/codebuild/standard:7.0" # Ubuntu 22.04 LTS runner        - Ref. https://docs.aws.amazon.com/codebuild/latest/userguide/ec2-compute-images.html 
  codebuild_container_compute_type = "BUILD_GENERAL1_SMALL"       # 2 vCPU - 4 GiB - 64 GB storage - Ref. https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html 

  subnets_suffix = "default" # In my case my subnets have tag names "default-a". "default-b" and "default-c". Change to your convenience.

  # SNS Notification email list
  emails = [
    "stefano@my-amazing-mail.com",
  ]
}
