resource "aws_db_subnet_group" "default" {
  name       = "medusa-db-subnet-group"
  subnet_ids = [var.public_subnet_id]

  tags = {
    Name = "Medusa DB subnet group"
  }
}

resource "aws_security_group" "db_sg" {
  name        = "medusa-db-sg"
  description = "Allow Postgres access"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "medusa_db" {
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "14.5"
  instance_class       = "db.t3.micro"
  db_name              = "medusadb"
  username             = var.db_username
  password             = var.db_password
  skip_final_snapshot  = true
  publicly_accessible  = true
  db_subnet_group_name = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.db_sg.id]
}
