resource aws_instance "rhel_test_box" {
    ami = data.aws_ami.rhel_ami.image_id
    instance_type = "t2.micro"
}