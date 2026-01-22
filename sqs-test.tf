# =============================================================================
# SQS Queue - Test Resource for Worker Pool Validation
# =============================================================================

# AWS Provider
provider "aws" {
  region = "us-west-2"
}

# Simple SQS Queue to test worker pool
resource "aws_sqs_queue" "spacelift_test" {
  name = "spacelift-worker-pool-test-queue"

  # Standard queue settings
  delay_seconds              = 0
  max_message_size           = 262144 # 256 KB
  message_retention_seconds  = 345600 # 4 days
  receive_wait_time_seconds  = 0
  visibility_timeout_seconds = 30

  # Enable server-side encryption
  sqs_managed_sse_enabled = true

  tags = {
    Project     = "spacelift"
    Environment = "sandbox"
    ManagedBy   = "spacelift"
    Purpose     = "worker-pool-test"
    Owner       = "L3-STEPS-PlatformServices"
  }
}

output "sqs_queue_url" {
  description = "URL of the test SQS queue"
  value       = aws_sqs_queue.spacelift_test.url
}

output "sqs_queue_arn" {
  description = "ARN of the test SQS queue"
  value       = aws_sqs_queue.spacelift_test.arn
}
