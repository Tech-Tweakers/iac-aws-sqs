output "id" {
  value       = join("", aws_sqs_queue.main.*.id)
  description = "The URL for the created Amazon SQS queue."
}

output "arn" {
  value       = join("", aws_sqs_queue.main.*.arn)
  description = "The ARN of the SQS queue."
}
