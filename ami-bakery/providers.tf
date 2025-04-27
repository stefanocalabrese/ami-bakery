provider "aws" {
  region     = var.region
  profile =  "stefano"      # this needs to be created on your local machine 
}                           # containing the Access ID and Secret Key to access AWS
                            # run from Powershell: aws configure --profile your_profile_name
provider "null" {}

provider "random" {}

provider "template" {}