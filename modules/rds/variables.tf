variable "vpc_id" {
  type        = string
  description = "vpc_id"
}

variable "project" {
  type    = string
  default = "my-project"  
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

variable "region" {
  description = "AWS region to deploy resources."
  type        = string
}

variable "backup_retention_period" {
  description = "AWS region to deploy resources."
  type        = any
  default = 7
}

