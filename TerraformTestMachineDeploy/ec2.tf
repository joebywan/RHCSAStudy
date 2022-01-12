resource "aws_instance" "rhel_test_box" {
  ami                  = data.aws_ami.rhel_ami.image_id
  instance_type        = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.ec2-ssm-instance-profile.id
  user_data            = file("./installSSM.sh")
}