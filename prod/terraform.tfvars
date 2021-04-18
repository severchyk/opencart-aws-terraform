# AWS Settings
aws_region             = "us-east-2"
aws_availability_zones = ["us-east-2a", "us-east-2b", "us-east-2c"]
aws_instance_type      = "t3.medium"
eks_cluster_name       = "prod-eks-opencart"
kubeconfig_output_path = "./kubeconfig"
rds_engine             = "mysql"
rds_engine_version     = "5.7"
rds_instance_class     = "db.t2.micro"
rds_db_name            = "opencart"
rds_username           = "opencart"
rds_password           = "opencart"
rds_db_port            = "3306"
