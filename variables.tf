variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-2"
}

variable "cluster_name" {
  description = "ECS Cluster name"
  type        = string
  default     = "proyectobase-cluster"
}

variable "ecr_image_url" {
  description = "URL completa de la imagen en ECR"
  type        = string
}

