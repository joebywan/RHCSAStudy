data "aws_ami" "rhel_ami" {
  most_recent = true

  #Redhat's owner id
  owners = ["309956199498"]
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "name"
    values = ["RHEL-8*"]
  }
  name_regex = "RHEL-8\\.5\\.[0-9]_HVM-(BET[^A])*[0-9]{8}-x86_64.*"
}