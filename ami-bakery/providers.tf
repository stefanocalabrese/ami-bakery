provider "aws" {
  region = var.region

  # this needs to be created on your local machine containing the Access ID
  # and Secret Key to access AWS. run from Powershell: aws configure --profile your_profile_name
  profile = "stefano"
}

provider "aws" {
  alias  = "sns"
  region = var.sns["region"]


  assume_role {
    role_arn     = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.sns["role-name"]}"
    session_name = "sns-${var.sns["region"]}"
  }
}


provider "null" {}

provider "random" {}

provider "template" {}
