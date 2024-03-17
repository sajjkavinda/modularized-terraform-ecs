variable "aurorards_admin" {
  description = "Database administrator username"
  type        = string
  sensitive   = true
}


variable "aurorards_admin_password" {
  description = "Database administrator password"
  type        = string
  sensitive   = true
}

variable "aurorards_az_a" {
  description = "Cluster az a"
  type        = string
  
}

variable "aurorards_az_b" {
  description = "Cluster az b"
  type        = string
  
}

variable "aurorards_cluster_identifier" {
  description = "Cluster Identifier"
  type = string
}

variable "aurorards_engine" {
  description = "Cluster engine"
  type        = string
  
}

variable "aurorards_engine_version" {
  description = "Cluster engine version"
  type        = string
  
}

variable "aurorards_database_name" {
  description = "Cluster database name"
  type        = string
  
}

variable "aurorards_storage_type" {
  description = "Cluster database storage type"
  type        = string
  
}

variable "aurorards_backtrack_window" {
  description = "Cluster database backtrack"
  type        = string
  
}

variable "aurorards_preferred_backup_window" {
  description = "Cluster preferred backup window"
  type        = string
  
}

variable "aurorards_preferred_maintenance_window" {
  description = "Cluster preferred maintenance window"
  type        = string
  
}

variable "aurorards_storage_encrypted" {
  description = "Cluster storage encrypted"
  type        = string
  
}

variable "aurorards_skip_final_snapshot" {
  description = "Cluster skip final snapshot"
  type        = string
  
}

variable "aurorards_deletion_protection" {
  description = "Cluster deletion protection"
  type        = string
  
}

variable "aurorards_publicly_accessible" {
  description = "Cluster publicly accessible"
  type        = string
  
}

variable "aurorards_intance_publicly_accessible" {
  description = "Intance publicly accessible"
  type        = string
  
}

variable "aurorards_intance_count" {
  description = "Intance count"
  type        = string
  
}

variable "aurorards_intance_identifier" {
  description = "Intance identifier"
  type        = string
  
}

variable "aurorards_instance_class" {
  description = "Intance instance class"
  type        = string
  
}

variable "aurorards_cluster-sub_grp" {
  description = "Cluster subnet group"
  type        = string
  
}

variable "pvt_subnet-rds_sub_1" {
  
}
variable "pvt_subnet-rds_sub_2" {
  
}

variable "rds_sg" {
  
}