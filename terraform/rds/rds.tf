resource "aws_db_instance" "medusa_db" {
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "15.2"
  instance_class         = "db.t3.micro"
  name                   = "medusadb"
  username               = var.db_username
  password               = var.db_password
  skip_final_snapshot    = true
  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.alb_sg.id]

  tags = {
    Name = "medusa-db"
  }
}
