variable "CanonicalId" {
  type = "list"
  default = ["099720109477"]
}



variable "VpcId" {
  type = "string"
  description = "VPC ID to use"
}


variable "Ec2Name" {
  type = "string"
  description = "Name of the EC2 Instance"
}

variable "Ec2Type" {
  type = "string"
  description = "The EC2 instance type"
}

variable "KeyName" {
  type = "string"
  description = "PrivateKey for SSH"

}


variable "SubnetId" {
  type = "string"
  description = "SubnetToDeployInto"

}

variable "SecurityGroupCreated" {
  description = "The Output value of the Security Group module"
  default = ""
}
