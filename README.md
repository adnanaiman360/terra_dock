# Terraform-Docker Infrastructure Project

A lightweight, real-world infrastructure project using **Terraform** and **Docker** to provision and manage containerized services locally with production-grade features like **persistent volumes**, **environment variables**, and **log configuration**.

---

## Project Objective

To simulate a practical Infrastructure-as-Code (IaC) workflow where services (like NGINX and demo apps) are defined, deployed, and maintained entirely through Terraform. Emphasis is on:

* Declarative provisioning
* Reusability
* Real-world practices (volumes, env vars, logging)

---

## Services Provisioned

| Container | Purpose                    | Port   | Extras                      |
| --------- | -------------------------- | ------ | --------------------------- |
| NGINX     | Serves custom static files | `8080` | Volume-mounted HTML content |
| Hello App | Demo app from Docker Hub   | `8081` | Supports environment vars   |

---

## Tech Stack

* [Terraform](https://www.terraform.io/) (`~> 1.5`)
* [Docker](https://www.docker.com/)
* Terraform Docker Provider (`kreuzwerker/docker`)

---

## Features Implemented

* ✅ Infrastructure as Code using Terraform
* ✅ Custom Docker network
* ✅ Persistent volume to NGINX container
* ✅ Environment variable injection into app containers
* ✅ Logging limits using Docker log options
* ✅ Modular structure with `variables.tf` and `outputs.tf`

---

## Folder Structure

```bash
terra_dock/
├── main.tf             # Core Terraform definitions
├── variables.tf        # Configurable variables
├── outputs.tf          # Outputs like container URLs
├── terraform.tfvars    # Optional override values
├── nginx-html/         # Volume-mounted content for NGINX
│   └── index.html
```

---

## How to Use

### 1. Clone & Init

```bash
git clone "https://github.com/adnanaiman360/terra_dock.git"
cd terra_dock
terraform init
```

### 2. Plan the Deployment

```bash
terraform plan
```

### 3. Apply and Deploy

```bash
terraform apply
```

### 4. Test in Browser

* NGINX: [http://localhost:8080](http://localhost:8080)
* Hello App: [http://localhost:8081](http://localhost:8081)

---

## Noteworthy Configs

### Volume Mount

```hcl
volumes {
  host_path      = abspath("${path.module}/nginx-html")
  container_path = "/usr/share/nginx/html"
}
```

### Env Vars

```hcl
env = [
  "APP_MODE=production",
  "GREETING=Terraform Rocks!"
]
```

### Logging Options

```hcl
log_driver = "json-file"
log_opts = {
  "max-size" = "10m"
  "max-file" = "3"
}
```

---

## Key Learnings

* How to provision infrastructure declaratively
* Docker container networking and management via Terraform
* Making infrastructure reusable with variables and outputs
* Real-world practices like data persistence and log control

