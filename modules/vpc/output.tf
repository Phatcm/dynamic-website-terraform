output "vpc" {
  value = module.vpc
}

output "vpc_id" {
  value = module.vpc.vpc_id
}


output "alb_sg" {
  value = aws_security_group.alb_sg.id
}

output "webserver_sg" {
  value = aws_security_group.webserver_sg.id
}

output "ssh_sg" {
  value = aws_security_group.ssh_sg.id
}

output "db_subnet_group_name"{
  value = aws_db_subnet_group.database.name
}