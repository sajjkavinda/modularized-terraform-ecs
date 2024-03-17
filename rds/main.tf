resource "aws_db_subnet_group" "nonp-soms_v2-apse1-rds-postgres_cluster-sub_grp" {
  name       = var.aurorards_cluster-sub_grp
  subnet_ids = ["${var.pvt_subnet-rds_sub_1.id}", "${var.pvt_subnet-rds_sub_2.id}"]  ##need to check
}

resource "aws_rds_cluster" "nonp-somsv2-apse1-rds-postgres-cluster" {
  cluster_identifier = var.aurorards_cluster_identifier
  engine             = var.aurorards_engine
  engine_version     = var.aurorards_engine_version
  #engine_mode             = "global"
  availability_zones = [var.aurorards_az_a, var.aurorards_az_b]
  database_name      = var.aurorards_database_name
  

  storage_type    = var.aurorards_storage_type
  master_username = var.aurorards_admin
  master_password = var.aurorards_admin_password
  backtrack_window = var.aurorards_backtrack_window
  #kms_key_id                   = aws_kms_key.rds_app_enc_key.arn
  preferred_backup_window      = var.aurorards_preferred_backup_window
  preferred_maintenance_window = var.aurorards_preferred_maintenance_window
  storage_encrypted            = var.aurorards_storage_encrypted
  #final_snapshot_identifier = "test"
  skip_final_snapshot = var.aurorards_skip_final_snapshot
  deletion_protection = var.aurorards_deletion_protection
  #backtrack_window       = 12 #If needed
  db_subnet_group_name   = aws_db_subnet_group.nonp-soms_v2-apse1-rds-postgres_cluster-sub_grp.name
  vpc_security_group_ids = ["${var.rds_sg.id}"]


  # lifecycle {
  #   prevent_destroy = true
  #  #ignore_changes  = all
  # }

}

resource "aws_rds_cluster_instance" "nonp-soms_v2-apse1-rds-postgres_cluster_instance" {

  # lifecycle {
  #   prevent_destroy = true
  #   #ignore_changes  = all
  # }

  publicly_accessible  = var.aurorards_publicly_accessible
  count                = var.aurorards_intance_count
  identifier           = var.aurorards_intance_identifier
  cluster_identifier   = var.aurorards_cluster_identifier
  instance_class       = var.aurorards_instance_class 
  db_subnet_group_name = aws_db_subnet_group.nonp-soms_v2-apse1-rds-postgres_cluster-sub_grp.name  ##Need to check
  engine               = var.aurorards_engine
  engine_version       = var.aurorards_engine_version

  depends_on = [ aws_rds_cluster.nonp-somsv2-apse1-rds-postgres-cluster ]


}
