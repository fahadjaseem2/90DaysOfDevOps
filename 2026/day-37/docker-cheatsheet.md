# Docker Cheat Sheet

## Container Commands
docker run -it nginx /bin/bash        # Run container interactively
docker run -d nginx                   # Run container in detached mode
docker ps                             # List running containers
docker ps -a                          # List all containers
docker stop <container_id>            # Stop a container
docker start <container_id>           # Start a stopped container
docker rm <container_id>              # Remove container
docker exec -it <container_id> bash   # Execute command inside container
docker logs <container_id>            # View container logs

## Image Commands
docker build -t myimage:1.0 .         # Build image from Dockerfile
docker images                         # List images
docker pull nginx                     # Download image from Docker Hub
docker push username/image:tag        # Push image to Docker Hub
docker tag image newname:tag          # Tag an image
docker rmi <image_id>                 # Remove image

## Volume Commands
docker volume create myvolume         # Create volume
docker volume ls                      # List volumes
docker volume inspect myvolume        # Inspect volume
docker volume rm myvolume             # Remove volume

## Network Commands
docker network create mynetwork       # Create network
docker network ls                     # List networks
docker network inspect mynetwork      # Inspect network
docker network connect mynetwork container_name

## Docker Compose Commands
docker compose up                     # Start services
docker compose up -d                  # Start in detached mode
docker compose down                   # Stop and remove containers
docker compose ps                     # List compose containers
docker compose logs                   # View logs
docker compose build                  # Build services

## Cleanup Commands
docker system prune                   # Remove unused data
docker container prune                # Remove stopped containers
docker image prune                    # Remove unused images
docker volume prune                   # Remove unused volumes
docker system df                      # Show Docker disk usage

## Dockerfile Instructions
FROM ubuntu:22.04                     # Base image
RUN apt-get update                    # Run commands during build
COPY . /app                           # Copy files into image
WORKDIR /app                          # Set working directory
EXPOSE 80                             # Expose container port
CMD ["python","app.py"]               # Default command
ENTRYPOINT ["nginx"]                  # Main container command