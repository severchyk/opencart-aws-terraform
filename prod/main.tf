#--------------- RDS outputs ---------------#

output "database_instance_endpoint" {
  value       = module.rds.this_db_instance_endpoint
  description = "Database instance endpoint"
}

#--------------- EKS outputs ---------------#

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_id" {
  value = module.eks.cluster_id
}

output "cluster_version" {
  value = module.eks.cluster_version
}
