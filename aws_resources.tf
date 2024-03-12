# Create AWS Instance
resource "aws_instance" "lab6_security" {
  ami           = "ami-0f403e3180720dd7e" 
  instance_type = "t2.micro"
  tags = {
    Name        = "Lab6Instance"
    Environment = "Production"
    Owner       = "Reshmi Harikumar Lathakumari"
  }

  # Associate IAM Instance Profile
  iam_instance_profile = aws_iam_instance_profile.my_instance_profile.name
}


# Create AWS Instance Profile
resource "aws_iam_instance_profile" "my_instance_profile" {
  name  = "my-instance-profile"
  role  = aws_iam_role.my_new_role.name
}