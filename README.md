# 🧱 DevOps-Lab2 – Infrastructure as Code (IaC) with Terraform

This repository contains the **Infrastructure as Code (IaC)** configuration used to deploy on AWS the environment required for the **DevOps-Lab2** project – _ECS / Fargate Orchestration & CI/CD Automation_.  
The infrastructure is fully managed with **Terraform**, ensuring automated, repeatable, and secure provisioning of scalable cloud resources.

---

## 🚀 Deployed Resources

This configuration provisions a complete orchestration environment using **Amazon ECS with Fargate**, designed to host containerized front-end applications with high availability.

### Core AWS components:

- **Amazon ECR (Elastic Container Registry):** Private Docker image registry.  
- **Amazon ECS (Elastic Container Service):** Container orchestration service used with **Fargate** as the compute engine.  
- **ECS Task Definition:** Describes the container image, resources, and execution role.  
- **ECS Service:** Manages desired task count and deployment strategy (rolling updates).  
- **Application Load Balancer (ALB):** Distributes incoming traffic across Fargate tasks.  
- **VPC (Virtual Private Cloud):** Includes two public subnets across different Availability Zones for redundancy.  
- **Security Groups:** Allow inbound HTTP (port 80) and outbound traffic for ECS tasks.  
- **CloudWatch Log Group:** Stores application logs for monitoring and troubleshooting.  
- **IAM Role:** Grants ECS tasks permissions to pull images from ECR and send logs to CloudWatch.

---

## 🗺️ Architecture Overview

```
                     +-----------------------------------+
                     |           AWS Account             |
                     |                                   |
                     |   +---------------------------+   |
                     |   |       Amazon ECR          |   |
                     |   |   (Image Registry)        |   |
                     |   +------------▲--------------+   |
                     |                |                  |
                     |     Pull image | via IAM Role     |
                     |                |                  |
                     |   +---------------------------+   |
Internet ⇄ ALB ⇄ TG ⇄ |     ECS Service (Fargate)   | ⇄ CloudWatch Logs
                     |   |  - lab2-task              |   |
                     |   |  - lab2-service           |   |
                     |   +------------▼--------------+   |
                     |        Amazon VPC + Subnets       |
                     +-----------------------------------+
```

---

## 📂 Project Structure

```
Devops-Lab2-Terraform-IaC/
├── main.tf        # Main Terraform configuration (ECR, ECS, ALB, IAM, VPC, CloudWatch)
├── variables.tf   # Input variables (region, cluster name, etc.)
├── outputs.tf     # Output values (ECR URL, ECS Cluster, Load Balancer DNS)
├── .gitignore     # Ignored local state and temporary files
└── README.md      # Project documentation
```

---

## ⚙️ Requirements

Before applying this configuration, ensure you have:

- **Terraform** installed → [Terraform Installation Guide](https://developer.hashicorp.com/terraform/downloads)  
- **AWS CLI** configured with a valid profile that assumes a Terraform role (e.g., `terraform-assumido`).  
- An **AWS account** with permissions to create and manage:
  - ECS clusters and task definitions  
  - Application Load Balancers  
  - VPCs and networking components  
  - ECR repositories  
  - IAM roles and CloudWatch log groups  

---

## 🧭 Usage

### 1. Initialize Terraform
```bash
terraform init
```

### 2. Preview the execution plan
```bash
terraform plan
```

### 3. Apply the configuration (create resources)
```bash
terraform apply
```
Confirm with `yes` when prompted.

Once applied successfully, Terraform will output:
- The **ECR repository URL**
- The **ECS Cluster name**
- The **Load Balancer DNS name**


### 4. Destroy all resources
```bash
terraform destroy
```
This removes all created resources, avoiding unnecessary AWS costs.

---

## 🎯 Project Goal

This repository is part of the **DevOps Golden Path**, a progressive roadmap to mastering cloud infrastructure and automation.

Here, the focus is on **orchestration and scalability**, moving from EC2-based deployments (Lab1) to a fully managed **ECS Fargate** setup — laying the foundation for serverless and multi-environment deployments in future labs.

---

## 🧩 Technical Notes

- Default AWS Region: **us-east-2 (Ohio)**  
- Networking: Two public subnets (us-east-2a, us-east-2b) under a custom VPC.  
- Default Load Balancer: **Application Load Balancer (HTTP/80)**  
- ECS Launch Type: **Fargate** (serverless container runtime)  
- IAM Roles:
  - `lab2-ecsTaskExecutionRole` → grants access to ECR + CloudWatch Logs.  
- Logging:
  - Centralized under CloudWatch group `/ecs/lab2`.  
- Task Definition:
  - Default image: `nginx:latest` (placeholder, replaced by pipeline during deployment).

---

## 🔗 Integration with CI/CD

This IaC project pairs directly with the **DevOps-Lab2** repository:

- The CI/CD pipeline (`.github/workflows/deploy.yml`) builds and pushes Docker images to ECR.
- It then registers a new ECS Task Definition and updates the Fargate service.
- All AWS resources referenced by the pipeline are provisioned here via Terraform.

> Ensure this IaC is deployed before running the CI/CD workflow in **DevOps-Lab2**, as the pipeline depends on the output values (ECR URL, ECS Cluster, Service name, ALB DNS).

---

## 🧠 Key Learnings

- Designing cloud infrastructure for container orchestration (ECS + Fargate).  
- Using Terraform to model and automate multi-component architectures.  
- Managing IAM roles, networking, and load balancing declaratively.  
- Implementing modular infrastructure as a foundation for future labs.  
- Establishing a clean integration between IaC and CI/CD pipelines.

---

## 🧾 License
MIT License © Pablo Nicolás Girone

