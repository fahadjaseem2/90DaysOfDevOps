
# Day 36 – Docker Project: Dockerize a Full Application

## Task 1: Pick Your App

For this project, I chose a **Two-Tier Flask Application with MySQL Database**.

### Application Components

* **Flask (Python)** – Web application
* **MySQL** – Database for storing user messages

---

# Task 2: Write the Dockerfile

The Dockerfile is used to build a container image for the Flask application.

### Dockerfile

```dockerfile
FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    gcc \
    default-libmysqlclient-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN useradd -m fahad

USER fahad

EXPOSE 5000

CMD ["python", "app.py"]
```

### Explanation

**FROM python:3.11-slim**
Uses a lightweight Python base image.

**WORKDIR /app**
Sets the working directory inside the container.

**Install dependencies**
Installs system packages required for MySQL connectivity.

**COPY requirements.txt**
Copies the dependency file to the container.

**pip install commands**
Installs all Python dependencies.

**COPY . .**
Copies application code into the container.

**Create non-root user**
Improves container security.

**EXPOSE 5000**
Flask runs on port 5000.

**CMD**
Runs the Flask application.

---

# Task 3: Add Docker Compose

Docker Compose is used to run multiple containers together.

### docker-compose.yml

```yaml
version: "3.9"

services:

  db:
    image: mysql:latest
    container_name: two-tier-backend
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: ${MYSQL_ROOT_PASSWORD}
      MYSQL_DATABASE: ${MYSQL_DB}
    volumes:
      - mysql_db:/var/lib/mysql
    healthcheck:
      test: ["CMD","mysqladmin","ping","-h","localhost"]
      interval: 10s
      retries: 5
    networks:
      - two-tier-net

  web:
    image: fahadjaseem/twotier-flask:v1.0.0
    container_name: flask_app
    ports:
      - "5000:5000"
    environment:
      MYSQL_HOST: ${MYSQL_HOST}
      MYSQL_USER: ${MYSQL_USER}
      MYSQL_PASSWORD: ${MYSQL_PASSWORD}
      MYSQL_DB: ${MYSQL_DB}
    depends_on:
      db:
        condition: service_healthy
    networks:
      - two-tier-net

volumes:
  mysql_db:

networks:
  two-tier-net:
```

### Environment Variables (.env)

```
MYSQL_HOST=db
MYSQL_USER=root
MYSQL_PASSWORD=admin
MYSQL_DB=admin_db
MYSQL_ROOT_PASSWORD=admin
```

---

# Task 4: Ship It

### Tag the Image

```
docker tag two-tier-flask-app-web:latest fahadjaseem/twotier-flask:v1.0.0
```

### Push Image to Docker Hub

```
docker push fahadjaseem/twotier-flask:v1.0.0
```

### Docker Hub Repository

https://hub.docker.com/r/fahadjaseem/twotier-flask


---

# Task 5: Test the Whole Flow

To verify the project works from a fresh environment:

### Remove Containers and Images

```
docker compose down -v (-v = volume)
docker rm -f $(docker ps -aq)
docker rmi -f $(docker images -aq)
```

### Pull Images from Docker Hub

```
docker compose pull
```

### Run the Application

```
docker compose up -d
```

Docker pulls the Flask image from Docker Hub and MySQL from the Docker registry.

### Verify Running Containers

```
docker ps
```

Expected containers:

* Flask application container
* MySQL database container

---

# Final Image Size

```
361 MB
```

Base Image Used:

```
python:3.11-slim
```

---

# Conclusion

In this project, I successfully:

* Dockerized a Flask application
* Created a multi-container setup using Docker Compose
* Configured environment variables with `.env`
* Pushed the Docker image to Docker Hub
* Verified the application works from a clean environment

This exercise demonstrates how containerization enables applications to run consistently across different environments.
