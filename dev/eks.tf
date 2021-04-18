module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "14.0.0"
  cluster_name    = var.eks_cluster_name
  cluster_version = "1.18"
  vpc_id          = aws_default_vpc.default.id
  subnets         = ["subnet-2432984f", "subnet-f7a84b8a", "subnet-6a7f3426"]
  #vpc_id          = module.vpc.vpc_id
  #subnets         = module.vpc.public_subnets

  worker_groups = [
    {
      name             = "worker_group"
      instance_type    = var.aws_instance_type
      asg_max_size     = 3
      root_volume_type = "gp2"
    }
  ]

  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capaicty     = 1

      instance_types = [var.aws_instance_type]
    }
  }

  config_output_path = var.kubeconfig_output_path

  manage_aws_auth = false

  create_eks = true
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}
