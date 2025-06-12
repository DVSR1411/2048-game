resource "aws_iam_role" "ecs_role" {
  name       = "ECSDeploymentRole"
  depends_on = [aws_iam_role.CodeBuildServiceRole]
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = aws_iam_role.CodeBuildServiceRole.arn
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}
resource "aws_iam_role_policy" "ecs_policy" {
  name = "ecs-deployment-access"
  role = aws_iam_role.ecs_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ecs:*",
          "cloudformation:*",
          "iam:*",
          "autoscaling:*",
          "ec2:*",
          "ssm:GetParameter",
          "logs:CreateLogGroup",
          "logs:PutLogEvents",
          "logs:CreateLogStream"
        ]
        Resource = "*"
      }
    ]
  })
}
