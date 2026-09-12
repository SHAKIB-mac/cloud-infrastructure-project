# Cloud Infrastructure Monitoring & Deployment Lab

## Overview

This project is a hands-on cloud infrastructure monitoring and deployment lab designed to demonstrate practical skills required for a Junior Cloud Engineer or Cloud/DevOps Internship role.

The project combines Linux system administration, networking, Python monitoring, Flask web services, Docker, Docker Compose, and Git/GitHub into one integrated environment.

## Architecture

```text
Client
  |
  | HTTP :8000
  v
Ubuntu Linux Host
  |
  v
Docker Compose
  |
  v
Docker Container
  |
  v
Flask Web Service
  |
  v
Python Monitoring Application
  |
  +---- CPU Usage
  +---- Memory Usage
  +---- Disk Usage
  +---- Hostname
  +---- IP Address
```

## Technologies

- Linux / Ubuntu
- Python
- Flask
- Docker
- Docker Compose
- Git
- GitHub
- Linux Networking
- Bash Scripting

## Project Features

- Linux system health monitoring
- CPU, memory, and disk monitoring
- Hostname and IP address detection
- Automatic HEALTHY/WARNING status detection
- Python-based monitoring application
- Flask HTTP monitoring service
- Docker containerization
- Docker Compose deployment
- Container networking
- Automatic container restart policy
- Git version control
- GitHub project hosting

## Project Structure

```text
cloud-infrastructure-project/
├── app/
│   ├── monitor.py
│   ├── requirements.txt
│   └── web_app.py
├── docker/
│   ├── Dockerfile
│   └── docker-compose.yml
├── scripts/
│   └── system_health.sh
├── .gitignore
└── README.md
```

## Running the Project

### Start the application

```bash
docker compose -f docker/docker-compose.yml up -d --build
```

### Check the container

```bash
docker ps
```

### Test the monitoring service

```bash
curl http://localhost:8000
```

### Stop the application

```bash
docker compose -f docker/docker-compose.yml down
```

## Example Output

```text
Cloud Infrastructure Monitoring Service

Hostname: <container-hostname>
CPU Usage: <cpu>%
Memory Usage: <memory>%
Disk Usage: <disk>%
IP Address: <container-ip>
Status: HEALTHY
```

## Testing

The project has been tested across multiple infrastructure layers, including:

- Python monitoring execution
- Flask HTTP endpoint
- Docker container startup
- Docker container restart
- Docker Compose deployment
- Container networking
- Python dependency installation
- Dockerfile build
- System health Bash script
- Git repository synchronization
- GitHub repository push

## Key Engineering Practices

This project demonstrates practical experience with:

- Linux command-line administration
- Bash scripting
- Linux networking
- System resource monitoring
- Python application development
- Flask web services
- Docker image creation
- Docker container management
- Docker Compose orchestration
- Container networking
- Service restart policies
- Git version control
- GitHub repository management
- Infrastructure troubleshooting

## Future Improvements

Planned improvements include:

- Automated Python unit tests
- CI/CD pipeline using GitHub Actions
- Production WSGI server
- Centralized application logging
- Monitoring dashboard
- Cloud deployment on AWS or Azure
- Infrastructure as Code using Terraform
- Kubernetes deployment
- Automated infrastructure health checks

## Learning Outcomes

Through this project, I practiced integrating multiple cloud engineering fundamentals into a single working environment.

The project strengthened my practical understanding of:

- Linux infrastructure
- Networking
- Python
- Docker
- Docker Compose
- Git/GitHub
- System monitoring
- Infrastructure troubleshooting

## Author

**Shakib**

Cloud Engineer / Cloud & DevOps Internship Candidate
