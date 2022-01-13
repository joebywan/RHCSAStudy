#Creates resource representing the default vpc
resource "aws_default_vpc" "default_vpc" {
}

# Security group for the instance.  Allows SSM through so we don't need SSH
# keys to connect
resource "aws_security_group" "RHCSA_SG" {
  name = "RHCSA Test Environment SG"
  description = "Allows 443 for SSM to the RHCSA test boxe(s)"
  vpc_id = aws_default_vpc.default_vpc.id
}

#Allow all outbound
resource "aws_security_group_rule" "allow_outbound" {
  type = "egress"
  from_port = "0"
  to_port = "65535"
  protocol = "-1"
  cidr_blocks = [
    "0.0.0.0/0"
  ]
  security_group_id = aws_security_group.RHCSA_SG.id  
}

#Allow 443 in (port SSM uses)
resource "aws_security_group_rule" "allow_SSM" {
  type = "ingress"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]
  security_group_id = aws_security_group.RHCSA_SG.id
}