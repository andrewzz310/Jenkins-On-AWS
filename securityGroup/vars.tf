variable "VpcId" {
  type = "string"
  description = "VPC ID to use"
}

variable "AccessKey" {
  type = "string"
  description = "Access Key of the IAM User/Role to use for deployment of Resources"
}

variable "SecretKey" {
  type = "string"
  description = "Secret Key of the IAM User/Role to use for deployment of Resources"
}

variable "SgName" {
  type = "string"
  description = "Name of the Security Group"
}


variable "LocalIp" {
  type = "string"
  description = "Local Public Ip"
}