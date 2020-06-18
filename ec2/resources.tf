provider "aws" {
  region = "us-west-2"
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

data "local_file" "InstallJenkins" {
  filename = "${path.module}/InstallJenkins.sh"
}




#EC2 Instance
resource "aws_instance" "JenkinsServer" {
  ami = "${data.aws_ami.UbuntuLatest.id}"
  instance_type = "${var.Ec2Type}"
  key_name = "${var.KeyName}"
  subnet_id = "${var.SubnetId}"
  vpc_security_group_ids = ["${var.SecurityGroupCreated}"]
  user_data = "${data.local_file.InstallJenkins.content}"

  tags = {
    Name = "${var.Ec2Name}"
  }
}

