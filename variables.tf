variable "project_name" {
  description = "Nombre del proyecto base"
  type        = string
  default     = "proyectobase"
}

variable "vpc_cidr" {
  description = "CIDR de la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "Subredes públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "azs" {
  description = "Zonas de disponibilidad"
  type        = list(string)
  default     = ["us-east-2a", "us-east-2b"]
}

variable "ecr_image_url" {
  description = "URL completa de la imagen de Docker en ECR"
  type        = string
}
