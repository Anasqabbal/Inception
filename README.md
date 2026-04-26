# Inception

![Score](https://img.shields.io/badge/score-125%2F100-success)
![Docker](https://img.shields.io/badge/concept-Docker-blue)
![DevOps](https://img.shields.io/badge/DevOps-SysAdmin-success)

## 📌 Overview
**Inception** is a system administration project at 1337 (42 Network) that broadens our knowledge of DevOps and Docker. The goal is to build a complete, multi-container web infrastructure using Docker and Docker Compose.

For a modern Software Engineer, containerization is essential for deploying applications consistently across different environments. This project proved my ability to orchestrate complex services from the ground up without relying on pre-built images.

## 💡 Core Concepts Explored
### Containerization & Orchestration
**Definition:** Containerization packages an application and its dependencies into a single isolated unit called a container. Orchestration manages the lifecycle and networking of multiple containers.
**Problem Solved:** It solves the "it works on my machine" problem by standardizing environments across development and production, allowing complex microservices to be deployed, scaled, and networked easily.

## 🚀 Features
- **Custom Dockerfiles:** Built images entirely from Alpine or Debian base images.
- **NGINX:** Configured as a web server using TLS/SSL (HTTPS only).
- **WordPress & PHP-FPM:** A fully functional WordPress site installed and configured dynamically.
- **MariaDB:** A secure database container linked to the WordPress site.
- **Docker Compose:** Orchestration of all services securely via internal Docker networks.
- **Volumes:** Persistent storage for both the database and the WordPress site data.
- **Redis Cache (Bonus):** Configured a Redis instance to cache WordPress data and improve response times.
- **FTP Server (Bonus):** Setup a vsftpd container pointing to the WordPress volume for secure file transfers.
- **Adminer (Bonus):** A lightweight database management interface linked to the MariaDB instance.
- **Static Website (Bonus):** Deployed a simple static portfolio website in its own isolated container.

## 📥 How to Clone
To clone this project, use the following command:
```bash
git clone git@github.com:Anasqabbal/Inception.git
cd Inception
```

## 🛠️ Usage
Launch the infrastructure using the Makefile:
```bash
make
```
This runs `docker-compose up -d --build`. You can access the WordPress site at `https://<your_login>.42.fr` after editing your `/etc/hosts` file.

## 🧠 What I Learned
- Containerization concepts: Images, Containers, Volumes, and Networks.
- Writing robust `Dockerfiles` and `docker-compose.yml`.
- Configuring web servers (NGINX) and databases (MariaDB).
- Implementing SSL certificates for secure HTTPS connections.

## 🌐 Connect with me
[![GitHub](https://img.shields.io/badge/GitHub-black?logo=github)](https://github.com/Anasqabbal)
[![LinkedIn](https://img.shields.io/badge/-IN-0A66C2?logo=linkedin&logoColor=0a66c2)](https://www.linkedin.com/in/anasqabbal/)

