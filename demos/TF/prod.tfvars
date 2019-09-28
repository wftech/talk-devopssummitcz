region = "eu-west-1"

environment = "prod"

vpc_cidr = "172.17.0.0/16"

security_group_name = "sec_group"

private_subnets = [
  "172.17.0.0/18",
  "172.17.64.0/18",
]

public_subnets = [
  "172.17.128.0/24",
  "172.17.129.0/24",
]

static_app_url = "aeronmatch.com"

rds_backup_retention_period = "14"

rds_skip_last_snapshot = false

rds_instance_type = "db.t2.medium"

ec2_app_instance_type = "t2.medium"

prevent_destroy = {
  protect_s3  = true
  protect_efs = true
  protect_rds = true
}
