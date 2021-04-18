module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "2.34.0"

  identifier = "dev-opencart-db"

  engine            = var.rds_engine
  engine_version    = var.rds_engine_version
  instance_class    = var.rds_instance_class
  allocated_storage = 5

  name     = var.rds_db_name
  username = var.rds_username
  password = var.rds_password
  port     = var.rds_db_port

  iam_database_authentication_enabled = false

  publicly_accessible = true

  create_db_option_group    = false
  create_db_parameter_group = false

  multi_az = false
  #vpc_security_group_ids = [module.security-group.this_security_group_id]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  monitoring_interval    = "0"
  monitoring_role_name   = "MyRDSMonitoringRole"
  create_monitoring_role = false

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  # DB subnet group
  subnet_ids = ["subnet-2432984f", "subnet-f7a84b8a", "subnet-6a7f3426"]
  #subnet_ids = module.vpc.private_subnets

  # DB parameter group
  family = "mysql5.7"

  # DB option group
  major_engine_version = "5.7"

  # Database Deletion Protection
  deletion_protection = false

  skip_final_snapshot = true

  parameters = [
    {
      name  = "character_set_client"
      value = "utf8mb4"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    }
  ]

  create_db_instance = true
}
