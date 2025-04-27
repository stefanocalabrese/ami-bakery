variable "aws_access_key_id" {
  type        = string
  default     = ""                     # Will default to env variable
  description = "AWS Access Key ID, it is assumed it is exported in your host env vars"
}

variable "aws_secret_access_key" {
  type        = string
  default     = ""                     # Will default to env variable
  description = "AWS Secret Access Key, it is assumed it is exported in your host env vars"
}

variable "region" {
  type        = string
  default     = "eu-central-1"         # Frankfurt
  description = "The AWS Region"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "The environment where we are deploying to"
}
