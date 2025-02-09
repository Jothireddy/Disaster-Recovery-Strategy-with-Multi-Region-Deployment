resource "aws_db_instance" "rds_instance" {
  identifier              = var.db_instance_identifier
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = var.db_instance_class
  allocated_storage       = var.db_allocated_storage
  username                = var.db_username
  password                = var.db_password
  multi_az                = true
  storage_type            = "gp2"
  publicly_accessible     = false
  skip_final_snapshot     = true

  tags = {
    Name = "DR-Demo-RDS"
  }
}
