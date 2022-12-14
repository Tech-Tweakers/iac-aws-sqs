resource "aws_sqs_queue" "main" {
  name                        = var.queue_name
  visibility_timeout_seconds  = var.visibility_timeout_seconds
  message_retention_seconds   = var.message_retention_seconds
  max_message_size            = var.max_message_size
  delay_seconds               = var.delay_seconds
  receive_wait_time_seconds   = var.receive_wait_time_seconds
  policy                      = var.policy
  redrive_policy              = var.create_dlq ? jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq_main[0].arn
    maxReceiveCount     = var.redrive_policy_maxReceiveCount
  }) : ""
  fifo_queue                  = var.fifo_queue
  content_based_deduplication = var.content_based_deduplication

  kms_master_key_id                 = var.kms_master_key_id
  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds

  tags = var.tags
}

resource "aws_sqs_queue" "dlq_main" {
  count                       = var.create_dlq ? 1 : 0
  name                        = var.dlq_name
  visibility_timeout_seconds  = var.visibility_timeout_seconds
  message_retention_seconds   = var.message_retention_seconds
  max_message_size            = var.max_message_size
  delay_seconds               = var.delay_seconds
  receive_wait_time_seconds   = var.receive_wait_time_seconds
  policy                      = var.policy
  fifo_queue                  = var.fifo_queue
  content_based_deduplication = var.content_based_deduplication

  kms_master_key_id                 = var.kms_master_key_id
  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds

  tags = var.tags
}

/* resource "aws_sns_topic_subscription" "sns_sqs_subscription" {
  for_each              = toset(var.topic_arns)
  topic_arn             = each.key
  protocol              = "sqs"
  endpoint              = aws_sqs_queue.main.arn
  filter_policy         = var.subscription_filter_policy
  raw_message_delivery  = var.raw_message_delivery
} */
