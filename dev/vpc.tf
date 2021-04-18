module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "dev-eks-vpc"
  cidr = "10.0.0.0/16"

  azs = var.aws_availability_zones

  create_database_subnet_group           = true
  create_database_internet_gateway_route = true
  create_database_nat_gateway_route      = true

  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_vpn_gateway   = true
  enable_dns_hostnames = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
