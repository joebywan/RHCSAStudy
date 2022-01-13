#Assumerole role
resource "aws_iam_role" "ec2_ssm_role" {
  name               = "ssm-ec2"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

#Instance Profile
resource "aws_iam_instance_profile" "ec2-ssm-instance-profile" {
  name = "ec2-ssm-instance-profile"
  role = aws_iam_role.ec2_ssm_role.id
}

#Attach Policies to Instance Role
resource "aws_iam_policy_attachment" "attach_AmazonSSMManagedInstanceCore" {
  name       = "attach_AmazonSSMManagedInstanceCore"
  roles      = [aws_iam_role.ec2_ssm_role.id]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_policy_attachment" "attach_AmazonEC2RoleforSSM" {
  name       = "attach_AmazonEC2RoleforSSM"
  roles      = [aws_iam_role.ec2_ssm_role.id]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}