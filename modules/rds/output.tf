output "rds_instance_address" {
  value = aws_db_instance.rds.address
}

output "rds_instance_port" {
  value = aws_db_instance.rds.port
}

output "rds_instance_username" {
  value = aws_db_instance.rds.username
}

output "rds_instance_password" {
  value = aws_db_instance.rds.password
}

output "db_instance_arn" {
  value = aws_db_instance.rds.arn
}

output "rds_endpoint_address" {
  value = aws_db_instance.rds.endpoint
}
