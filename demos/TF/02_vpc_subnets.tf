## vpc and subnets
module "vpc" {
  source = "github.com/terraform-aws-modules/terraform-aws-vpc"

  name            = "vpc-${var.environment}"
  cidr            = var.vpc_cidr
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway   = "true"
  enable_dns_hostnames = "true"
  enable_dns_support   = "true"

  azs = ["eu-west-1a", "eu-west-1b"]

  tags = {
    "Terraform"   = "true"
    "Environment" = var.environment
  }
}

