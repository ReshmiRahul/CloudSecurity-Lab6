# disassociate_policy.tfi



resource "aws_iam_policy_attachment" "detach_policy" {
  name       = "detach-policy"
  roles      = [aws_iam_role.my_new_role.name]
  policy_arn = aws_iam_policy.my_policy.arn
}
