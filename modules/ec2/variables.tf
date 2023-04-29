variable "vpc_id" {
  type        = string
  description = "vpc_id"
}

variable "webserver_sg_id" {
  type        = string
  description = "webserver sg"
}

variable "project" {
  type    = string
  default = "my-project"  
}