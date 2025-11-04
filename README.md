# 🧩 DevOps Lab 2 – ECS / Fargate Orchestration & CI/CD Automation

This repository is part of the **DevOps Golden Path**, a modular learning roadmap designed to build real-world cloud and DevOps expertise through progressive, production-grade projects.

---

## 🎯 Purpose of the Golden Path

The goal of this series is to evolve a full DevOps ecosystem step-by-step, where each lab represents a new stage in automation, scalability, and reliability:

| Lab | Focus |
|-----|--------|
| 1 | Containerization & CI/CD on AWS (EC2) |
| **2** | **Orchestration on AWS ECS / Fargate (this repo)** |
| 3 | Serverless Evolution (Lambda + API Gateway + S3) |
| 4 | Persistence & Databases (RDS / DynamoDB) |
| 5 | CI/CD Advanced & Observability |

Each lab has its own GitHub repository and Terraform-based IaC project, ensuring reproducible, automated cloud environments.

---

## 🚀 Project Overview

**DevOps Lab 2** extends the previous EC2-based setup and migrates the containerized React application to a fully managed, orchestrated environment using **Amazon ECS on Fargate**.

The project demonstrates how to:

- Replace manual EC2 deployments with container orchestration.
- Use an **Application Load Balancer (ALB)** for traffic management.
- Implement a fully automated CI/CD pipeline with **GitHub Actions**, **Docker Buildx**, and **ECR**.
- Maintain zero-downtime deployments via service updates.

---

## ⚙️ How It Works – CI/CD Pipeline

The workflow `.github/workflows/deploy.yml` automates the build-and-deploy lifecycle:

### **1️⃣ Build Phase**
- Checks out source code.  
- Installs dependencies & runs tests.  
- Builds multi-stage Docker images (`builder` → `runtime`).  

### **2️⃣ Publish Phase**
- Pushes both images to:
  - **Docker Hub** (public reference)
  - **Amazon ECR** (private deployment repo)

### **3️⃣ Deploy Phase**
- Registers a new ECS Task Definition (Fargate).  
- Updates the ECS Service linked to an **Application Load Balancer**.  
- Waits for the service to stabilize → achieving **zero-downtime** deployment.  

Each push to the `main` branch or new semantic version tag (`v1.0.0`, `v1.1.0`, etc.) triggers a full CI/CD cycle automatically.

---

## 🏗️ Infrastructure as Code (IaC)

The infrastructure for ECS Fargate is provisioned via Terraform in a separate repository:

🔗 **[Devops-Lab2-Terraform-IaC](https://github.com/PabloNicolas87/Devops-Lab2-Terraform-IaC)**

Terraform defines and manages:
- **Amazon ECR** (private image registry)  
- **Amazon VPC**, Subnets & Security Groups  
- **Application Load Balancer (ALB)** + Target Groups  
- **ECS Cluster**, Service & Task Definition  
- **IAM Roles & Policies**  
- **CloudWatch Log Groups**  

> Each resource is deployed reproducibly using `terraform init`, `terraform apply`, and can be destroyed with `terraform destroy`.

---

## 🧩 Architecture Overview

```
┌──────────────────────────────────────┐
│           GitHub Actions (CI/CD)      │
│  ──────────────────────────────────  │
│  • Build & Test                      │
│  • Push to DockerHub + ECR           │
│  • Register Task Definition on ECS    │
│  • Update Service (Fargate)          │
└────────────────────┬─────────────────┘
                     │
                     ▼
┌──────────────────────────────────────┐
│        AWS Infrastructure (Terraform)│
│  ──────────────────────────────────  │
│  • Amazon ECR (Container Repo)       │
│  • Amazon ECS (Fargate Service)      │
│  • Application Load Balancer (ALB)   │
│  • CloudWatch Logs / IAM Roles       │
└──────────────────────────────────────┘
```

---

## 📦 Tech Stack

| Category | Tools / Services |
|-----------|-----------------|
| Front-end | React + Vite |
| CI/CD | GitHub Actions + AWS CLI |
| Containers | Docker / Docker Buildx |
| Cloud | AWS (ECS Fargate, ECR, ALB, CloudWatch) |
| IaC | Terraform |
| Language | TypeScript |

---

## 🧠 Key Learnings
- Building multi-stage Docker images and pushing to multiple registries.  
- Automating zero-downtime deployments via ECS Fargate and ALB.  
- Using Terraform to define orchestrated infrastructure.  
- Configuring IAM roles and policies for ECS tasks.  
- Centralizing environment variables and secrets in GitHub Actions.  
- Extending a modular DevOps pipeline towards scalable cloud deployments.  

---

## 🔜 Next Step
**Lab 3 – Serverless Evolution**

The next module transitions the architecture from container orchestration to serverless execution, leveraging:
- **AWS Lambda**
- **API Gateway**
- **S3 Static Hosting**

This continues the Golden Path towards fully elastic, cost-efficient cloud applications.

---

## 🧾 License
MIT License © Pablo Nicolás Girone
