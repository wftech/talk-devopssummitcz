variable "region" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "security_group_name" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "rds_backup_retention_period" {
  type = string
}

variable "static_app_url" {
  type = string
}

variable "rds_skip_last_snapshot" {
  type    = string
  default = true
}

variable "rds_instance_type" {
  type    = string
  default = "db.t2.micro"
}

variable "ec2_app_instance_type" {
  type        = string
  default     = "t2.medium"
  description = "Ec2 instance for application backend."
}

# workaround for not-possible use of variable in lifecycle. github/terraform/issues/3116
variable "prevent_destroy" {
  type = map(string)

  default = {
    protect_s3  = true
    protect_efs = true
    protect_rds = true
  }
}

