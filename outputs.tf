output "load_balancer_dns" {
  description = "DNS del Load Balancer"
  value       = aws_lb.alb.dns_name
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.cluster.name
}

output "ecr_repository_url" {
  description = "URL del repositorio ECR"
  value       = aws_ecr_repository.ecr.repository_url
}
