variable "VpcId" {
  type = "string"
  description = "VPC ID to use"
}



variable "SgName" {
  type = "string"
  description = "Security Group Name"
  default = ""
}

variable "LocalIp" {
  type = "string"
  description = "Local Public Ip"
}

variable "Ec2Name" {
  type = "string"
  description = "Name of the EC2 Instance"
  default  = ""
}

variable "Ec2Type" {
  type = "string"
  description = "The EC2 instance type"
  default = ""
}

variable "KeyName" {
  type = "string"
  description = "PrivateKey for SSH"
  default = ""

}

variable "SubnetId" {
  type = "string"
  description = "SubnetToDeployInto"
  default = ""

}

