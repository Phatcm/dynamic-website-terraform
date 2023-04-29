variable "replica_region" {
  description = "AWS region to deploy resources."
  type        = string
}

variable "vpc_id" {
  type        = string
  description = "vpc_id"
}

variable "project" {
  type    = string
  default = "my-project"  
}

variable "profile" {
  type = string
}

variable "identifier" {
  type    = string
  default = "database"  
}

variable "engine" {
  type        = string
  description = "The database engine to use"
}

variable "engine_version" {
  type        = string
  description = "The version of the database engine to use"
}

variable "instance_class" {
  type        = string
  description = "The instance class to use"
}

variable "allocated_storage" {
  type        = number
  description = "The amount of storage to allocate for the database (in GB)"
}

variable "username" {
  type        = string
  description = "The username to use for the database"
}

variable "password" {
  type        = string
  description = "The password to use for the database"
}

variable "database_sg_id" {
  type    = any
  default = []
}

variable "db_subnet_group_name" {
  type        = string
  description = "The name of the parameter group to use"
}

variable "primary_db_arn" {
  description = "The identifier of the DB instance that will serve as the replication source."
  type        = any
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
