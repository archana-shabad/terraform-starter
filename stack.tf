data "spacelift_current_stack" "this" {}

# Commented out - this creates a child stack which requires proper GitHub integration
# To enable, configure the GitHub integration in Spacelift to access your repository
#
# resource "spacelift_stack" "managed" {
#   name        = "Managed stack"
#   description = "Your first stack managed by Terraform"
#
#   repository   = "terraform-starter"
#   branch       = "main"
#   project_root = "managed-stack"
#
#   autodeploy = true
#   labels     = ["managed", "depends-on:${data.spacelift_current_stack.this.id}"]
# }

# Resources below depend on spacelift_stack.managed which is commented out
# Uncomment when the GitHub integration is properly configured

# resource "spacelift_environment_variable" "stack-plaintext" {
#   stack_id   = spacelift_stack.managed.id
#   name       = "STACK_PUBLIC"
#   value      = "This should be visible!"
#   write_only = false
# }

# resource "random_password" "stack-password" {
#   length  = 32
#   special = true
# }

# resource "spacelift_environment_variable" "stack-writeonly" {
#   stack_id = spacelift_stack.managed.id
#   name     = "STACK_SECRET"
#   value    = random_password.stack-password.result
# }

data "spacelift_ips" "ips" {}

# resource "spacelift_mounted_file" "stack-plaintext-file" {
#   stack_id      = spacelift_stack.managed.id
#   relative_path = "stack-plaintext-ips.json"
#   content       = base64encode(jsonencode(data.spacelift_ips.ips.ips))
#   write_only    = false
# }

# resource "spacelift_mounted_file" "stack-secret-file" {
#   stack_id      = spacelift_stack.managed.id
#   relative_path = "stack-secret-password.json"
#   content       = base64encode(jsonencode({ password = random_password.stack-password.result }))
# }
