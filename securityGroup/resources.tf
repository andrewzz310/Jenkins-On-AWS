provider "aws" {
  region = "us-west-2"
  access_key = "${var.AccessKey}"
  secret_key = "${var.SecretKey}"
}



#Security Group to be created
resource "aws_security_group" "Ec2AccessLocal" {
  name = "Ec2LocalAccess"
  description = "Allow local from 22"
  vpc_id = "${var.VpcId}"
  ingress {
    description = "Incoming SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${var.LocalIp}"]

  }
  ingress {
    description = "Incoming HTTP"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["${var.LocalIp}"]
  }
  ingress {
    description = "Incoming Jenkins"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["${var.LocalIp}"]
  }

   egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.SgName}"

  }

}

output "SecurityGroupCreated" {
  value = "${aws_security_group.Ec2AccessLocal.id}"
}