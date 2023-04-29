provider "aws" {
  region = var.replica_region
  profile = var.profile
}

#vpc for replica rds
module "vpc" {
  source = "../vpc"
  project   = var.project
  vpc_cidr = var.vpc_cidr
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  aws_avaibility_zones = var.aws_avaibility_zones
  ssh_location = var.ssh_location
}


#replica rds
resource "aws_db_instance" "replica_rds" {

  identifier             = "my-db-replica"
  instance_class         = var.instance_class
  allocated_storage      = var.allocated_storage
  password               = var.password
  vpc_security_group_ids = [module.vpc.webserver_sg]
  db_subnet_group_name   = module.vpc.db_subnet_group_name
  publicly_accessible = false

  backup_retention_period = 7

  # Enable backups
  backup_window = "03:00-04:00"
  maintenance_window = "Mon:04:00-Mon:04:30"
  skip_final_snapshot = true
  delete_automated_backups = true

  # Replication configuration
  replicate_source_db  = var.primary_db_arn
  multi_az                      = false

  
  tags = merge(
    {
      "Name" = "${var.project}-${var.identifier}"
    }
  )
}

output "dr_endpoint" {
  value = aws_db_instance.replica_rds.endpoint
}

