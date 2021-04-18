variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "aws_availability_zones" {
  type        = list(any)
  description = "AWS availability zones"
}

variable "aws_instance_type" {
  type        = string
  description = "AWS instance type"
}

variable "eks_cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "kubeconfig_output_path" {
  type        = string
  description = "Path to store kubeconfig file"
}

variable "rds_engine" {
  type        = string
  description = "RDS database engine"
}

variable "rds_engine_version" {
  type        = string
  description = "RDS engine version"
}

variable "rds_instance_class" {
  type        = string
  description = "RDS instance class"
}

variable "rds_db_name" {
  type        = string
  description = "RDS database name"
}

variable "rds_username" {
  type        = string
  description = "RDS username"
}

variable "rds_password" {
  type        = string
  description = "RDS password"
}

variable "rds_db_port" {
  type        = string
  description = "RDS database port"
}
