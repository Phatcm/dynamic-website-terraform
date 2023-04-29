output "load_balancer_arn" {
  value = aws_lb.application_load_balancer.arn
}

output "listener_arns" {
  value = aws_lb_listener.alb_https_listener.*.arn
}

output "target_group_arns" {
  value = aws_lb_target_group.alb_tg.*.arn
}

output "load_balancer_dns_name" {
  value = aws_lb.application_load_balancer.dns_name
}

output "load_balancer_zone_id" {
  value = aws_lb.application_load_balancer.zone_id
}