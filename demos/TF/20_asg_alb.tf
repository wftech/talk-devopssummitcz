module "asg" {
  source = "terraform-aws-modules/autoscaling/aws"
  name   = "example_service"

  # Launch configuration
  lc_name = "example_service_lc"

  image_id        = "ami-08935252a36e25f85"
  instance_type   = "t2.micro"
  key_name	  = "david.karban"
  security_groups = [module.sg.this_security_group_id]

  ebs_block_device = [
    {
      device_name           = "/dev/xvdz"
      volume_type           = "gp2"
      volume_size           = "50"
      delete_on_termination = true
    },
  ]

  root_block_device = [
    {
      volume_size = "50"
      volume_type = "gp2"
    },
  ]

  # Auto scaling group
  asg_name                  = "example-asg"
  vpc_zone_identifier       = module.vpc.public_subnets
  health_check_type         = "EC2"
  min_size                  = 2
  max_size                  = 5
  desired_capacity          = 2
  wait_for_capacity_timeout = 0

  tags = [
    {
      key                 = "Environment"
      value               = "dev"
      propagate_at_launch = true
    },
    {
      key                 = "Project"
      value               = "megasecret"
      propagate_at_launch = true
    },
  ]

  target_group_arns = module.alb.target_group_arns

  user_data = file("20_asg_alb.userdata.txt")

}

module "alb" {
  source = "terraform-aws-modules/alb/aws"

  load_balancer_name       = "example-alb"
  security_groups          = [module.sg.this_security_group_id]
  subnets                  = module.vpc.public_subnets
  vpc_id                   = module.vpc.vpc_id
  http_tcp_listeners       = "${list(map("port", "80", "protocol", "HTTP"))}"
  http_tcp_listeners_count = "1"

  logging_enabled = false

  target_groups       = "${list(map("name", "foo", "backend_protocol", "HTTP", "backend_port", "80"))}"
  target_groups_count = "1"
}
