# SNS topic and subscription
resource "aws_sns_topic" "notification_email_topic" {
  name                           = "send-email-for-infra-notifications"
  http_success_feedback_role_arn = aws_iam_role.sns_role.arn
  http_failure_feedback_role_arn = aws_iam_role.sns_role.arn

  delivery_policy = jsonencode({
    "http" : {
      "defaultHealthyRetryPolicy" : {
        "minDelayTarget" : 20,
        "maxDelayTarget" : 20,
        "numRetries" : 3,
        "numMaxDelayRetries" : 0,
        "numNoDelayRetries" : 0,
        "numMinDelayRetries" : 0,
        "backoffFunction" : "linear"
      },
      "disableSubscriptionOverrides" : false,
      "defaultThrottlePolicy" : {
        "maxReceivesPerSecond" : 1
      }
    }
  })

  tags = {
    environment = var.environment
    group       = "notifications"
  }
}

resource "aws_sns_topic_subscription" "notification_sns_email_target_subscr" {
  count                = length(local.emails)
  topic_arn            = aws_sns_topic.notification_email_topic.arn
  protocol             = "email"
  endpoint             = local.emails[count.index]
  raw_message_delivery = false
}
