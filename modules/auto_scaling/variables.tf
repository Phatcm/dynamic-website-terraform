variable "vpc_id" {
  type        = string
  description = "vpc_id"
}

variable "project" {
  type    = string
  default = "my-project"  
}

variable "instances_name" {
  type    = string
  default = "my-project"  
}

variable "subnets" {
  type    = list(string)
}

variable "launch_template_id" {
  type = string
}

variable "launch_template_version" {
  type = string
}

variable "target_group_arn" {
  type    = set(string)
}