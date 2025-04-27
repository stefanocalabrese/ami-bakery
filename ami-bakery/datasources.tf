data "aws_caller_identity" "current" {} # We will use it to fetch the Account ID

data "aws_vpc" "vpc" { # Using the default VPC for test, you are welcome to create your own VPC with
  default = true       # the needed components (subnets, NAT, IGW, routes, nacl, etc)
}

data "aws_secretsmanager_secret_version" "codebuild" { # to be created in GitHub developer settings and stored in AWS Secret Manager
  secret_id = "github_codebuild_token"                 # feel free to change the name of your secret
}

data "aws_subnets" "subnets" {
  filter {
    name   = "Tag:Name"
    values = ["${local.subnets_suffix}-*"]
  }
}
