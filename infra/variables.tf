variable "region" {
  description = "AWS region for the S3 bucket (CloudFront itself is global)"
  type        = string
  default     = "ap-south-1"
}

variable "name" {
  description = "Name prefix for resources"
  type        = string
  default     = "devops-flashcards"
}

variable "github_repo" {
  description = "Your repo in owner/name form, for example myuser/devops-flashcards"
  type        = string
}

variable "create_oidc_provider" {
  description = "Set to false if your AWS account already has the GitHub OIDC provider"
  type        = bool
  default     = true
}
