variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-2"
}

variable "cluster_name" {
  description = "ECS Cluster name"
  type        = string
  default     = "lab2-cluster"
}

