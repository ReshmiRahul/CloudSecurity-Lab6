# Create an IAM policy for the role
resource "aws_iam_policy" "my_policy" {
  name        = "my-policy"
  description = "IAM policy for my task"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect"   : "Allow",
        "Action"   : [
          "ec2:Describe*",
          "ec2:RunInstances",
          "ec2:TerminateInstances",
          "s3:*"
        ],
        "Resource" : "*"
      }
    ]
  })
}
