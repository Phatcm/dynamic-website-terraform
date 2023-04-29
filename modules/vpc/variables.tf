variable "project" {
  type    = string
  default = "my-project"  
}

#VPC variables
variable "vpc_cidr" {
  description   = "vpc cidr block"
  type          = string
}

variable "public_subnets" {
  description   = "vpc public_subnets"
  type          = list(string)
}

variable "private_subnets" {
  description   = "vpc private_subnets"
  type          = list(string)
}

variable "aws_avaibility_zones" {
  description   = "aws_avaibility_zones"
  type          = list(string)
}

#ssh ip
variable "ssh_location" {
  description   = "the ip address that can access into the ec2 instances"
  type          = string
}

