# Spring Boot CI/CD Infrastructure with Terraform, Jenkins and Docker

## 🇪🇸 Descripción

Proyecto DevOps completo enfocado en automatización de infraestructura, integración continua (CI), entrega continua (CD) y despliegue automatizado de aplicaciones contenerizadas.

La infraestructura fue aprovisionada utilizando Terraform y desplegada sobre DigitalOcean, integrando Jenkins, Docker, GitHub Actions, Private Docker Registry y Docker Compose.

El proyecto implementa un flujo real de CI/CD utilizando ramas Git (`feature`, `develop`, `main`) y automatizando desde el push del código hasta el despliegue final en ambientes separados.

---

#  Arquitectura Implementada

La infraestructura se compone de 3 instancias principales:

## 1️. Jenkins Server (Continuous Integration)

Responsable de:

- Escuchar cambios en la rama `develop`
- Ejecutar pruebas unitarias
- Construir el artefacto `.jar`
- Construir imágenes Docker
- Publicar imágenes en el Private Registry

---

## 2️. Private Docker Registry

Responsable de:

- Almacenar imágenes Docker privadas
- Permitir push/pull entre Jenkins y Consumer
- Servir imágenes para despliegue automatizado

---

## 3️. Consumer Server (Continuous Delivery)

Responsable de:

- Ejecutar Docker Compose
- Desplegar ambientes Development y Production
- Ejecutar GitHub Actions Self-hosted Runner
- Actualizar automáticamente contenedores tras merge a `main`

---

#  Tecnologías Utilizadas

- Terraform
- DigitalOcean
- Jenkins
- Jenkins Configuration as Code (JCasC)
- Docker
- Docker Compose
- GitHub Actions
- Self-hosted GitHub Runner
- Spring Boot
- Gradle
- PostgreSQL
- Adminer
- Bash Scripting
- Linux Ubuntu
- Git Flow

---

#  Flujo Completo CI/CD

## 🔹 Desarrollo

El flujo implementado utiliza la siguiente estrategia de ramas:

```text
feature/* → develop → main
```

---

## 🔹 Continuous Integration (CI)

### Paso 1
Se crea una rama feature:

```bash
git switch -c feat/nueva-funcionalidad
```

### Paso 2
Se realizan cambios y push:

```bash
git add .
git commit -m "feat: nueva funcionalidad"
git push origin feat/nueva-funcionalidad
```

### Paso 3
Se crea Pull Request:

```text
feature → develop
```

### Paso 4
Jenkins detecta automáticamente cambios en `develop` y ejecuta:

- Unit Testing con Gradle
- Build del `.jar`
- Docker Build
- Docker Tag
- Docker Push al Registry

---

## 🔹 Continuous Delivery (CD)

### Paso 5
Se crea Pull Request:

```text
develop → main
```

### Paso 6
Al realizar merge hacia `main`:

GitHub Actions ejecuta automáticamente:

- conexión al Consumer Server
- ejecución de Docker Compose
- actualización automática de imágenes
- recreación de contenedores

---

#  Docker Compose Multiambiente

El proyecto implementa dos ambientes independientes:

## 🔹 Development Environment

Servicios:

- Spring Boot Backend
- PostgreSQL
- Adminer

Puertos:

- Backend: `8080`
- PostgreSQL: `5452`
- Adminer: `8090`

---

## 🔹 Production Environment

Servicios:

- Spring Boot Backend
- PostgreSQL
- Adminer

Puertos:

- Backend: `8081`
- PostgreSQL: `5453`
- Adminer: `8091`

---

#  Infrastructure as Code (IaC)

Toda la infraestructura fue automatizada utilizando Terraform:

## Recursos aprovisionados

- Jenkins Droplet
- Registry Droplet
- Consumer Droplet
- Docker Installation
- Jenkins Installation
- Jenkins Plugins
- Jenkins Jobs
- GitHub Runner
- Docker Compose
- Docker Registry Configuration

---

#  Seguridad Implementada

- Variables sensibles mediante Terraform Variables
- Tokens ocultos mediante `sensitive = true`
- Private Docker Registry
- Separación de ambientes
- GitHub Self-hosted Runner

---

#  Estructura del Proyecto

```text
infra/
│
├── scripts/
│   ├── install_consumer.sh.tftpl
│   ├── install_jenkins.sh.tftpl
│   └── install_registry.sh
│
├── consumer.tf
├── jenkins.tf
├── main.tf
├── outputs.tf
├── registry.tf
├── variable.tf
└── .terraform.lock.hcl
```

---

# ▶️ Despliegue

Inicializar Terraform:

```bash
terraform init
```

Aplicar infraestructura:

```bash
terraform apply
```

---

#  Resultado Final

El proyecto permite:

 Aprovisionamiento automático de infraestructura  
 Integración continua automatizada  
 Entrega continua automatizada  
 Construcción automática de imágenes Docker  
 Registry privado  
 Despliegue automático multiambiente  
 Infraestructura reproducible con Terraform  

---

# 🇺🇸 English Description

Complete DevOps project focused on Infrastructure as Code, Continuous Integration (CI), Continuous Delivery (CD), and automated deployment of containerized applications.

The infrastructure was provisioned using Terraform and deployed on DigitalOcean, integrating Jenkins, Docker, GitHub Actions, Private Docker Registry, and Docker Compose.

The project implements a real CI/CD workflow using Git branches (`feature`, `develop`, `main`) and automates everything from code push to final deployment in separated environments.

---

#  Implemented Architecture

The infrastructure consists of 3 main servers:

## 1️. Jenkins Server (Continuous Integration)

Responsible for:

- Listening for changes on `develop`
- Running unit tests
- Building `.jar` artifacts
- Building Docker images
- Publishing Docker images to Private Registry

---

## 2️. Private Docker Registry

Responsible for:

- Storing private Docker images
- Allowing push/pull between Jenkins and Consumer
- Serving images for automated deployment

---

## 3️. Consumer Server (Continuous Delivery)

Responsible for:

- Running Docker Compose
- Deploying Development and Production environments
- Running GitHub Actions Self-hosted Runner
- Automatically updating containers after merge to `main`

---

#  Technologies Used

- Terraform
- DigitalOcean
- Jenkins
- Jenkins Configuration as Code (JCasC)
- Docker
- Docker Compose
- GitHub Actions
- Self-hosted GitHub Runner
- Spring Boot
- Gradle
- PostgreSQL
- Adminer
- Bash Scripting
- Ubuntu Linux
- Git Flow

---

#  Complete CI/CD Workflow

```text
feature/* → develop → main
```

---

## Continuous Integration (CI)

1. Create feature branch
2. Push changes
3. Pull Request to `develop`
4. Jenkins automatically executes:
   - Unit Tests
   - `.jar` Build
   - Docker Build
   - Docker Push

---

## Continuous Delivery (CD)

1. Pull Request from `develop` to `main`
2. Merge into `main`
3. GitHub Actions automatically:
   - connects to Consumer Server
   - executes Docker Compose
   - updates Docker images
   - recreates containers

---

# Multi-Environment Deployment

## Development Environment

Services:

- Spring Boot Backend
- PostgreSQL
- Adminer

---

## Production Environment

Services:

- Spring Boot Backend
- PostgreSQL
- Adminer

---

#  Infrastructure as Code

Infrastructure automated using Terraform:

- Jenkins Server
- Registry Server
- Consumer Server
- Docker Installation
- Jenkins Installation
- Jenkins Jobs
- GitHub Runner
- Docker Compose Configuration

---

#  Deployment

Initialize Terraform:

```bash
terraform init
```

Deploy infrastructure:

```bash
terraform apply
```

---

#  Final Result

The project provides:

 Automated infrastructure provisioning  
 Automated Continuous Integration  
 Automated Continuous Delivery  
 Automated Docker image builds  
 Private Docker Registry  
 Multi-environment deployment  
 Reproducible infrastructure using Terraform  

---

# Author

Emanuel Gonzalez

Systems Engineering Student