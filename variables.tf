variable "github_app_namespace" {
  description = "The namespace of the GitHub App to use for this stack (GitHub org or username)"
  type        = string
  default     = null  # Set via Spacelift environment variable or terraform.tfvars
}