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

## 🏗️ Architecture & System Design

The infrastructure is designed as a multi-tier web application centered around WordPress. The architecture enforces separation of concerns, ensuring that each container is responsible for a single, distinct service. All custom containers are built on **Alpine Linux (3.21)** to ensure a lightweight, secure, and minimal footprint.

### System Architecture Diagram

```text
                                  +------------------------------------+
                                  |            Host Machine            |
                                  |                                    |
                                  |   +----------------------------+   |
                                  |   |   Docker Custom Network    |   |
                                  |   |        'inception'         |   |
                                  |   |                            |   |
                                  |   |  +----------------------+  |   |
                                  |   |  |     [ nginx ]        |  |   |
    HTTPS (443)  -----------------|---|->| Reverse Proxy / TLS  |  |   |
                                  |   |  +----------------------+  |   |
                                  |   |             |              |   |
                                  |   |       FastCGI (9000)       |   |
                                  |   |             v              |   |
                                  |   |  +----------------------+  |   |
                                  |   |  |   [ wordpress ]      |  |   |
                                  |   |  |       PHP-FPM        |  |   |
                                  |   |  +----------------------+  |   |
                                  |   |        |          |        |   |
                                  |   |  MySQL |          | Redis  |   |
                                  |   | (3306) v          v (6379) |   |
                                  |   |  +---------+   +---------+ |   |
                                  |   |  | mariadb |   |  redis  | |   |
                                  |   |  +---------+   +---------+ |   |
                                  |   |                            |   |
                                  |   +----------------------------+   |
                                  |                                    |
                                  |          [ Bonus Services ]        |
    FTP (21)     -----------------|-----> [ vsftpd ] (FTP Server)      |
    HTTP (8080)  -----------------|-----> [ adminer ] (DB UI)          |
    HTTP (8081)  -----------------|-----> [ website ] (Static Site)    |
    HTTP (8082)  -----------------|-----> [ cadvisor ] (Monitoring)    |
                                  |                                    |
                                  +------------------------------------+
                                         |                   |
                                    wp-volume            db-volume
                                 (/home/.../wordpress) (/home/.../mariadb)
```

## 🌐 Network Topology

**Network Type:** Custom `bridge` network named `inception`.

### Why a Custom Bridge Network?
The system utilizes a user-defined bridge network rather than the default Docker bridge. This is a critical architectural choice because:
1. **Automatic DNS Resolution:** Containers can communicate with each other using their container names (e.g., WordPress connects to the database using the hostname `mariadb`).
2. **Isolation & Security:** It isolates the Inception ecosystem from other containers running on the host machine. Only containers explicitly attached to the `inception` network can communicate with each other.
3. **Control:** It allows for granular control over which ports are exposed to the host system versus which are only accessible internally.

## 📦 Container Specifications

### 1. NGINX (Reverse Proxy & Web Server)
* **Role:** Acts as the **only** entry point into the infrastructure. It terminates SSL/TLS connections, serves static files, and proxies dynamic PHP requests to the WordPress container via the FastCGI protocol.
* **Port Mapping (`443:443`):** Exposes HTTPS traffic. HTTP (port 80) is intentionally omitted for security.

### 2. MariaDB (Database Management System)
* **Role:** Serves as the persistent data store for the WordPress application. It holds all site configurations, user data, and post content.
* **Port Mapping (`3306:3306`):** Exposes the standard MariaDB port to allow direct connections.
* **Storage:** Data is persisted using a local bind mount (`db-volume` mapped to `/var/lib/mysql`).

### 3. WordPress (Application Server)
* **Role:** Backend application server running on **PHP-FPM**. Receives requests from NGINX, connects to MariaDB to fetch/store data, utilizes Redis for caching, and generates final HTML.
* **Port Mapping:** Internal only (listens on port 9000). Communicates over the internal `inception` network.
* **Storage:** Codebase and uploaded media are persisted using a bind mount (`wp-volume` mapped to `/var/www/html`).

### 4. Redis (In-Memory Data Store / Cache)
* **Role:** Implemented as a caching layer to reduce the load on MariaDB. It temporarily stores the results of complex database queries (Object Caching), drastically improving WordPress load times.
* **Port Mapping (`6379:6379`):** Exposes the standard Redis port.

### 5. VSFTPD (FTP Server)
* **Role:** Provides file transfer capabilities to directly manage and upload files to the WordPress web directory (`/var/www/html`).
* **Port Mapping (`21:21`):** Exposes the standard FTP control port.

### 6. Adminer (Database Management Interface)
* **Role:** Provides a lightweight graphical user interface (GUI) accessible via a web browser to manage the MariaDB databases.
* **Port Mapping (`8080:8080`):** Exposed on the host at port 8080.

### 7. Website (Static Web Server)
* **Role:** A secondary web server container serving a static HTML showcase or portfolio site.
* **Port Mapping (`8081:8080`):** Host port 8081 forwards traffic to port 8080 inside the container.

### 8. cAdvisor (Container Monitoring)
* **Role:** Acts as the monitoring layer of the architecture, collecting and processing information about running containers (CPU, memory, network usage).
* **Port Mapping (`8082:8080`):** Host port 8082 forwards traffic to the cAdvisor web UI on port 8080 inside the container.

## 💾 Data Persistence (Volumes)

To ensure that critical data survives container recreation or termination, the architecture uses Docker Volumes (configured as local bind mounts):
1. **`wp-volume`:** Bound to the host directory `/home/${USER}/data/wordpress`. It is shared across NGINX, WordPress, Website, and VSFTPD.
2. **`db-volume`:** Bound to the host directory `/home/${USER}/data/mariadb`. Dedicated exclusively to MariaDB.

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
