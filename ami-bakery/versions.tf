terraform {
  required_version = "1.9.7"
  required_providers {
    aws = {
      version = "~> 5.1.0"
      source  = "hashicorp/aws"
    }
    null = {
      version = "~> 2.0"
      source  = "hashicorp/null"
    }
    random = {
      version = "~> 3.4.3"
      source  = "hashicorp/random"
    }
    template = {
      version = "~> 2"
      source  = "hashicorp/template"
    }
  }
}