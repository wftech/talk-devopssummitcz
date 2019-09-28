# security groups

module "sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "example_app_service"
  description = "Security group for example service with ports 80, 443 open out and 22 inside VPC."
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "https-443-tcp"]
  ingress_with_cidr_blocks = [
    {
      rule        = "ssh-tcp"
      cidr_blocks = module.vpc.vpc_cidr_block
    },
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "all"
      description = "Default outbound all"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}
