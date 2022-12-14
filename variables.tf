variable "name" {
  description = "SQS Queue Name."
  default     = ""
}

variable "tags" {
  description = ""
  default = {
    product = ""
    team    = ""
    owner   = ""
    env     = ""
  }
}

variable "visibility_timeout_seconds" {
  type        = number
  default     = 30
  description = "The visibility timeout for the queue. An integer from 0 to 43200 (12 hours)."
}

variable "message_retention_seconds" {
  type        = number
  default     = 345600
  description = "The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days)."
}

variable "max_message_size" {
  type        = number
  default     = 262144
  description = "The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB)."
}

variable "delay_seconds" {
  type        = number
  default     = 0
  description = "The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 (15 minutes)."
}

variable "receive_wait_time_seconds" {
  type        = number
  default     = 0
  description = "The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning. An integer from 0 to 20 (seconds)."
}

variable "create_dlq" {
  default     = true
  description = ""
}

variable "policy" {
  type        = string
  default     = ""
  sensitive   = true
  description = "The JSON policy for the SQS queue."
}

variable "redrive_policy_maxReceiveCount" {
  default     = 4
  description = ""
}

variable "fifo_queue" {
  type        = bool
  default     = false
  description = "Boolean designating a FIFO queue."
}

variable "content_based_deduplication" {
  description = "Enables content-based deduplication for FIFO queues."
  type        = bool
  default     = false
}

variable "kms_master_key_id" {
  type        = string
  default     = ""
  sensitive   = true
  description = "The ID of an AWS-managed customer master key (CMK) for Amazon SQS or a custom CMK."
}

variable "kms_data_key_reuse_period_seconds" {
  type        = number
  default     = 300
  description = "The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again. An integer representing seconds, between 60 seconds (1 minute) and 86,400 seconds (24 hours)."
}

variable "topic_arns" {
  description = "SNS Topic ARNs to be subscribed."
  type        = list(string)
  default     = []
}

variable "subscription_filter_policy" {
  type        = string
  default     = ""
  sensitive   = true
  description = "The JSON filter policy for subscription."
}

variable "raw_message_delivery" {
  description = "Whether to enable raw message delivery (the original message is directly passed, not wrapped in JSON with the original message in the message property). Default is false"
  type        = bool
  default     = false
}
