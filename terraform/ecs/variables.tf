variable "db_username" {
  description = "Username for RDS"
  type        = string
}

variable "db_password" {
  description = "Password for RDS"
  type        = string
  sensitive   = true
}

variable "vpc_id" {
  description = "VPC ID from network module"
  type        = string
}

variable "public_subnet_id" {
  description = "Public subnet ID from network module"
  type        = string
}

variable "ecs_sg_id" {
  description = "Security group ID for ECS tasks"
  type        = string
}

variable "target_group_arn" {
  description = "Target group ARN for ALB"
  type        = string
}
