terraform {
  required_version = ">= 1.0.0"
}

locals {
  name = var.project_name
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
  profile = var.profile
}


module "vpc" {
  source = "./modules/vpc"
  project   = local.name
  vpc_cidr = var.vpc_cidr
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  aws_avaibility_zones = var.aws_avaibility_zones
  ssh_location = var.ssh_location
}

module "ec2"{
  source = "./modules/ec2"
  vpc_id = module.vpc.vpc_id
  webserver_sg_id = module.vpc.webserver_sg
}

module "load_balancer" {
  source = "./modules/load_balancer"
  subnets = module.vpc.vpc.public_subnets
  vpc_id = module.vpc.vpc_id
  alb_sg_id = module.vpc.alb_sg
  aws_avaibility_zones = var.aws_avaibility_zones
  ssl_certificate_arn = var.ssl_certificate_arn
}

module "auto_scaling"{
  source = "./modules/auto_scaling"
  project   = local.name
  vpc_id = module.vpc.vpc_id
  subnets = module.vpc.vpc.private_subnets
  launch_template_id = module.ec2.launch_template_id
  launch_template_version = module.ec2.launch_template_version
  instances_name = module.ec2.instance_name
  target_group_arn = module.load_balancer.target_group_arns
}

module "rds"{
  source = "./modules/rds"
  project   = local.name
  region = var.region
  vpc_id = module.vpc.vpc_id
  database_sg_id = module.vpc.webserver_sg
  db_subnet_group_name = module.vpc.db_subnet_group_name
  allocated_storage = var.allocated_storage
  engine = var.engine
  engine_version = var.engine_version
  instance_class = var.instance_class
  username = var.username
  password = var.password
}

module "dr"{
  source = "./modules/dr"
  project   = local.name
  profile = var.profile
  #replica vpc
  replica_region = var.dr_region
  vpc_cidr = var.vpc_cidr
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  ssh_location = var.ssh_location
  aws_avaibility_zones = var.aws_dr_avaibility_zones
  vpc_id = module.vpc.vpc_id
  #database
  database_sg_id = module.vpc.webserver_sg
  db_subnet_group_name = module.vpc.db_subnet_group_name
  allocated_storage = var.allocated_storage
  engine = var.engine
  engine_version = var.engine_version
  instance_class = var.instance_class
  username = var.username
  password = var.password
  primary_db_arn = module.rds.db_instance_arn
}

resource "aws_route53_zone" "hosted_zone" {
  name = var.domain_name
}

resource "aws_route53_record" "example_com" {
  zone_id = aws_route53_zone.hosted_zone.id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = module.load_balancer.load_balancer_dns_name
    zone_id                = module.load_balancer.load_balancer_zone_id
    evaluate_target_health = true
  }
}