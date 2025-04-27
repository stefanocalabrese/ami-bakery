data "aws_caller_identity" "current" {} # We will use it to fetch the Account ID

data "aws_vpc" "vpc" { # Using the default VPC for test, you are welcome to create your own VPC with
  default = true       # the needed components (subnets, NAT, IGW, routes, nacl, etc)
}

data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
}
