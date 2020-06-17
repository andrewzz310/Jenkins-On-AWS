provider "aws" {
  region = "us-west-2"
  access_key = "${var.AccessKey}"
  secret_key = "${var.SecretKey}"
}


# Obtain the most recent AMI to use for Ubuntu 18.04
data "aws_ami" "UbuntuLatest"  {
  most_recent =true

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = "${var.CanonicalId}"

}

#EC2 Instance
resource "aws_instance" "JenkinsServer" {
  ami = "${data.aws_ami.UbuntuLatest.id}"
  instance_type = "${var.Ec2Type}"
  key_name = "${var.KeyName}"
  subnet_id = "${var.SubnetId}"
  vpc_security_group_ids = ["${var.SecurityGroupCreated}"]

  tags = {
    Name = "${var.Ec2Name}"
  }
}

