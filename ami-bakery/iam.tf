# IAM Role for CodeBuild
resource "aws_iam_role" "codebuild" {
  name = "codebuild-packer-ansible-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "codebuild.amazonaws.com" # CodeBuild assumes this role
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "codebuild-packer-ansible-role"
  }
}

# IAM Policies
resource "aws_iam_policy" "codebuild_policy" {
  name        = "codebuild-packer-ansible-policy"
  description = "Policy for CodeBuild to use Packer, Ansible, and bake AMIs"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "iam:PassRole",         
          "iam:GetInstanceProfile"
        ]
        Resource = "*"
      },
      {
        Effect   = "Allow"
        Action   = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ]
        Resource = [
          aws_s3_bucket.bakery_store.id,
          "${aws_s3_bucket.bakery_store.id}/*"
        ]
      },
      {
        Effect   = "Allow"
        Action   = [
          "ssm:GetParameter"
        ]
        Resource = "*packer*"
      },
      {
        Effect = "Allow"
        Actions = [
          "kms:GenerateDataKey",
          "kms:GenerateDataKeyPair",
          "kms:GenerateDataKeyWithoutPlaintext",
          "kms:GenerateDataKeyPairWithoutPlaintext",
          "kms:Encrypt",
          "kms:Decrypt",
        ]
        Resource = ["*"]
      },
      {
        Effect = "Allow"
        Actions = [
          "ssm:GetParameter",
           "ssm:GetParametersByPath"
        ]
        Resource = ["arn:aws:ssm:${var.region}:${data.aws_caller_identity.current.account_id}:parameter/packer*"]
      },
      {
        Effect = "Allow"
        Actions = [
          "secretsmanager:DescribeSecret",
          "secretsmanager:ListSecretVersionIds",
          "secretsmanager:GetResourcePolicy",
          "secretsmanager:GetSecretValue",
        ]
        Resource = ["arn:aws:secretsmanager:${var.region}:${data.aws_caller_identity.current.account_id}:secret:packer/*"]
      },
      {
        Effect = "Allow"
        Actions = [
          "sns:Publish",
        ]
        Resource = ["arn:aws:sns:${var.region}:${data.aws_caller_identity.current.account_id}:email-infra-notifications"]
      }
    ]
  })
}

# Attach the policy to the role
resource "aws_iam_role_policy_attachment" "codebuild_policy_attach" {
  role       = aws_iam_role.codebuild_role.name
  policy_arn = aws_iam_policy.codebuild_policy.arn
}

resource "aws_iam_policy" "codebuild_cloudwatch_policy" {
  name        = "codebuild-cloudwatch-policy"
  description = "Policy for CodeBuild to send logs to Cloudwatch"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "*"
      }
      
    ]
  })
}

# Attach the policy to the role
resource "aws_iam_role_policy_attachment" "codebuild_cloudwatch_attach" {
  role       = aws_iam_role.codebuild_role.name
  policy_arn = aws_iam_policy.codebuild_cloudwatch_policy.arn
}

data "aws_iam_policy" "amazon_ec2_full_access" {
  arn = "arn:aws:iam::aws:policy/amazonEC2FullAccess"
}

# Attach the policy to the role
resource "aws_iam_role_policy_attachment" "codebuild_ec2_policy_attach" {
  role       = aws_iam_role.codebuild_role.name
  policy_arn = data.aws_iam_policy.amazon_ec2_full_access.arn
}
