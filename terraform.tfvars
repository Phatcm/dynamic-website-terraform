project_name = "terraform_aws"
region = "ap-northeast-1"
profile = "phatcao-dev"

#primary_region_vpc
vpc_cidr = "10.0.0.0/16"
public_subnets        = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnets         = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
aws_avaibility_zones = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
ssh_location = "0.0.0.0/0"

#secondary_region_vpc
aws_dr_avaibility_zones = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]

#ssl_arn
ssl_certificate_arn = "arn:aws:acm:ap-northeast-1:642702811292:certificate/74809a92-ae52-4f4d-bd19-3d19da2b30ca"

#database
allocated_storage = 20
engine = "mysql"
engine_version = "5.7"
instance_class = "db.t2.micro"
username   = "admin"
password   = "243278Gb"

#DR- region
dr_region = "ap-northeast-2"
dr_az = "ap-northeast-2c"

#Route 53
domain_name = "cmp-dev.click"