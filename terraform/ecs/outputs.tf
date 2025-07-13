output "db_endpoint" {
  description = "Endpoint of the RDS Postgres database"
  value       = aws_db_instance.medusa_db.address
}
