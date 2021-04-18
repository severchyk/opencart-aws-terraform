module "security-group" {
  source              = "terraform-aws-modules/security-group/aws"
  version             = "3.18.0"
  name                = "prod-rds-sg"
  ingress_rules       = ["http-80-tcp", "https-443-tcp", "ssh-tcp", "mysql-tcp"]
  egress_rules        = ["all-all"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_cidr_blocks  = ["0.0.0.0/0"]
  vpc_id              = module.vpc.vpc_id

  tags = {
    Name = "prod-rds-sg"
  }
}
