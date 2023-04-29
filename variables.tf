variable "project_name" {
  type = any
}

variable "region" {
  type = string
}

variable "profile" {
  type = string
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

variable "aws_dr_avaibility_zones" {
  description   = "aws_avaibility_zones"
  type          = list(string)
  default = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
}

variable "ssh_location" {
  description   = "the ip address that can access into the ec2 instances"
  type          = string
}

#ssl 
variable "ssl_certificate_arn" {
  type = string
  description = "ssl_certificate arn"
}

#database
variable "allocated_storage" {
  type        = number
  description = "The amount of storage to allocate for the database (in GB)"
}

variable "engine" {
  type        = string
  description = "The storage type to use"
}

variable "engine_version" {
  type        = string
  description = "The storage type to use"
}

variable "instance_class" {
  type        = string
  description = "The storage type to use"
}

variable "username" {
  type        = string
  description = "The username to use for the database"
}

variable "password" {
  type        = string
  description = "The password to use for the database"
}

#dr
variable "dr_region" {
  type        = string
  description = "dr_region"
}

variable "dr_az" {
  type        = string
  description = "dr_region"
}

#route53
variable "domain_name" {
  type        = string
  description = "domain name"
}