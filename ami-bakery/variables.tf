variable "aws_access_key_id" {
  type        = string
  default     = "" # Will default to env variable
  description = "AWS Access Key ID"
}

variable "aws_secret_access_key" {
  type        = string
  default     = "" # Will default to env variable
  description = "AWS Secret Access Key"
}

variable "region" {
  type        = string
  default     = "eu-central-1" # Frankfurt
  description = "The AWS Region"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "The environment where we are deploying to"
}

variable "sns" {
  type = map(any)
  default = {
    name         = "ami-bakery-notifications"
    display_name = "ami-bakery-notifications"
  }
}

variable "github_token" {
  description = "Sensitive token for Github"
  type        = string
  default     = "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"
  sensitive   = true
}
