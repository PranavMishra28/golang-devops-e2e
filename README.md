# Go Web Application DevOps Project

## 📋 Overview

This project demonstrates a complete end-to-end DevOps pipeline for a Golang-based web application, covering containerization, CI/CD automation, GitOps, and production-grade deployment using industry-standard tools. It provides a foundation for cloud-native applications with Kubernetes and microservices architecture.

The web application itself is a simple website built with Go's `net/http` package that serves static HTML pages.

![Website](static/images/golang-website.png)

## 🚀 Features

### Application Features
- Simple web server with multiple pages (Home, Courses, About, Contact)
- Static content serving
- Lightweight and fast Go-based implementation

### DevOps Implementation

#### 🐳 Containerization
- **Multi-Stage Docker Build**: 
  - Efficient containerization using a lightweight multi-stage Dockerfile
  - Build stage using official `golang` image
  - Runtime stage using minimal `distroless/base` image
  - Optimization for image size and security
  - Clear separation of build and runtime layers

#### 🎡 Kubernetes Deployment
- **Base Manifests**:
  - Deployment configuration with replicas and resource limits
  - Service definition for internal networking
  - ConfigMaps for environment-specific settings
  - Environment-agnostic templates for reusability

#### 📊 Helm Chart Configuration
- **Custom Helm Charts**:
  - Environment-specific values (Dev, QA, Production)
  - Parameterized templates for consistent deployments
  - Release management with versioning
  - Values overriding for environment customization

#### 🔄 CI Pipeline (GitHub Actions)
- **Automated Workflow**:
  - Triggered on every Git push
  - Parallel testing and linting
  - Docker image building with caching
  - Vulnerability scanning
  - Publishing to Docker Hub or Amazon ECR
  - Status notifications

#### 📤 CD Pipeline (ArgoCD + GitOps)
- **Declarative Delivery**:
  - Git repository as single source of truth
  - ArgoCD syncing changes from Git to the cluster
  - Automatic or manual promotion between environments
  - Rollback capabilities
  - Drift detection

#### ☁️ Kubernetes Cluster Setup
- **Amazon EKS Configuration**:
  - Managed Kubernetes with Fargate profiles
  - Required node groups and IAM roles
  - Proper network configuration
  - Security groups and policies
  - kubectl, eksctl, and Helm setup for access

#### 🌐 Ingress Controller
- **NGINX Ingress Controller**:
  - External access management
  - Path-based routing configured
  - TLS/HTTPS termination
  - Rate limiting and access control

#### 🔗 DNS Mapping
- **Domain Configuration**:
  - Custom domain exposure
  - Integration with AWS Route53
  - ExternalDNS for automatic DNS records
  - Load balancer configuration

## 🔧 Tech Stack & Tools

| Category | Tools Used |
|----------|------------|
| **Language** | Golang |
| **Containerization** | Docker (Multi-stage build) |
| **Orchestration** | Kubernetes (EKS) |
| **Package Management** | Helm |
| **CI/CD** | GitHub Actions, ArgoCD |
| **GitOps** | ArgoCD (Declarative delivery) |
| **Cluster Provisioning** | Amazon EKS, eksctl, kubectl |
| **Ingress** | NGINX Ingress Controller |
| **Domain Management** | AWS Route53, ExternalDNS |
| **Version Control** | Git + GitHub |

## 📈 Outcomes & Benefits

- **Fully Automated Pipeline**: Complete CI/CD pipeline from code push to production deployment
- **Environment Management**: Environment-specific configurations and scalable Helm-based releases
- **Modern Workflow**: GitOps approach aligned with current industry best practices
- **Scalability**: Foundation for microservices architecture with proper networking and service discovery
- **Security**: Reduced attack surface with distroless containers and proper network policies
- **Maintainability**: Declarative configurations with infrastructure as code principles

## 🏁 Getting Started

### Prerequisites

- Go 1.18 or higher
- Docker and Docker Compose
- kubectl and Helm
- AWS CLI and eksctl (for EKS deployment)
- ArgoCD CLI (optional)

### Local Development

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/go-web-app-devops.git
   cd go-web-app-devops
   ```

2. Run the application locally:
   ```bash
   go run main.go
   ```

3. Access the application at:
   - http://localhost:8080/home
   - http://localhost:8080/courses
   - http://localhost:8080/about
   - http://localhost:8080/contact

### Docker Build & Run

```bash
# Build the Docker image
docker build -t go-web-app:latest .

# Run the container
docker run -p 8080:8080 go-web-app:latest

# Access the application at http://localhost:8080/courses
```

### Kubernetes Deployment

#### Using Raw Manifests

```bash
# Apply the Kubernetes manifests
kubectl apply -f k8s/manifests/

# Verify the deployment
kubectl get pods
kubectl get svc
```

#### Using Helm

```bash
# Install using Helm
helm install go-web-app ./helm/go-web-app-chart

# Upgrade an existing release
helm upgrade go-web-app ./helm/go-web-app-chart --values ./helm/go-web-app-chart/values.yaml
```

### EKS Deployment

Follow the detailed instructions in the `eks/` directory:
1. Prerequisites: `eks/01-prereq.md`
2. Cluster Setup: `eks/02-install-eks-fargate.md`

### Setting Up ArgoCD

Follow the GitOps setup guide in `gitops/argocd/01-install.md`

## 📁 Project Structure

```
.
├── Dockerfile                 # Multi-stage Docker build
├── go.mod                     # Go module dependencies
├── main.go                    # Main application code
├── main_test.go               # Unit tests
├── eks/                       # EKS cluster setup documents
├── gitops/                    # GitOps configuration (ArgoCD)
├── helm/                      # Helm charts for the application
│   └── go-web-app-chart/
│       ├── Chart.yaml
│       ├── values.yaml        # Default values
│       └── templates/         # Kubernetes template manifests
├── ingress-controller/        # Ingress controller setup
├── k8s/                       # Raw Kubernetes manifests
│   └── manifests/
└── static/                    # Static web content
    ├── home.html
    ├── courses.html
    ├── about.html
    ├── contact.html
    └── images/
```

## 🧪 Testing

Run unit tests:

```bash
go test ./...
```

## 📜 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
