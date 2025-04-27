provider "aws" {
  region     = var.region

  # this needs to be created on your local machine containing the Access ID
  # and Secret Key to access AWS. run from Powershell: aws configure --profile your_profile_name
  profile =  "stefano"      
}                           

provider "null" {}

provider "random" {}

provider "template" {}
