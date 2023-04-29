variable "vpc_id" {
  type        = string
  description = "vpc_id"
}

variable "alb_sg_id"{
  type        = string
  description = "load balancer_sg id"  
}

variable "name" {
  type        = string
  description = "Name of the load balancer"
  default = "alb-dev"
}

variable "internal" {
  type        = bool
  description = "Whether the load balancer should be internal or public"
  default     = false
}

variable "type" {
  type        = string
  description = "The type of load balancer to create"
  default     = "application"
}

variable "target_type" {
  type        = string
  description = "The type of load balancer to create"
  default     = "instance"
}


variable "port" {
  type        = number
  description = "The port on which the load balancer should listen"
  default     = 80
}

variable "redirect_port" {
  type        = number
  description = "The port on redirect to https"
  default     = 443
}

variable "ssl_certificate_arn" {
  type = string
  description = "ssl_certificate arn"
}

variable "ssl_policy" {
  type = string
  description = "ssl_policy"
  default = "ELBSecurityPolicy-2016-08"
}

variable "health_check_path" {
  type        = string
  description = "The path on which to perform the health check"
  default     = "/"
}

variable "subnets" {
  type    = list(string)
}

variable "aws_avaibility_zones" {
  description   = "aws_avaibility_zones"
  type          = list(string)
}

