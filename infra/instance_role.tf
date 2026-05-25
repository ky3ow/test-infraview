resource "aws_iam_role" "infraview_instance" {
  name = "infraview-demo-instance"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy" "infraview_secrets" {
  name = "infraview-secrets-access"
  role = aws_iam_role.infraview_instance.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = [
        "secretsmanager:GetSecretValue",
        "secretsmanager:PutSecretValue",
        "secretsmanager:CreateSecret",
        "secretsmanager:DescribeSecret",
        "secretsmanager:ListSecretVersionIds"
      ]
      Resource = aws_secretsmanager_secret.infraview_store.arn
    }, {
      Effect   = "Allow"
      Action   = "s3:GetObject"
      Resource = "arn:aws:s3:::ky3ow-infraview-tfstate/artifacts/*"
    }]
    }]
  })
}

resource "aws_iam_instance_profile" "infraview" {
  name = "infraview-demo"
  role = aws_iam_role.infraview_instance.name
}
