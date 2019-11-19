output "alb_dns_name" {
  value       = aws_lb.stage-orlando.dns_name
  description = "The domain name of the load balancer"
}