output "load_balancer_dns" {
  description = "DNS del Load Balancer"
  value       = aws_lb.ecs_lb.dns_name
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.main.name
}
