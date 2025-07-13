output "alb_dns" {
  description = "DNS name of the ALB"
  value       = aws_lb.medusa_alb.dns_name
}

output "target_group_arn" {
  description = "ARN of the ALB target group"
  value       = aws_lb_target_group.medusa_tg.arn
}
