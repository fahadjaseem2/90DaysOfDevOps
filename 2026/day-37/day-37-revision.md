# Day 37 – Docker Revision

## Self Assessment Checklist

Run a container from Docker Hub – CAN DO  
List, stop, remove containers/images – CAN DO  
Explain image layers and caching – CAN DO  
Write Dockerfile from scratch – CAN DO  
Explain CMD vs ENTRYPOINT – CAN DO  
Build and tag custom image – CAN DO  
Create and use named volumes – CAN DO  
Use bind mounts – CAN DO  
Create custom networks – CAN DO  
Write docker-compose for multi-container app – CAN DO  
Use environment variables in Compose – CAN DO  
Write multi-stage Dockerfile – CAN DO  
Push image to Docker Hub – CAN DO  
Use healthchecks and depends_on – CAN DO  

---

## Quick Fire Answers

### Difference between image and container
An image is a read-only template used to create containers.  
A container is a running instance of that image.

### What happens to data when a container is removed?
Data inside the container filesystem is deleted unless it is stored in volumes or bind mounts.

### How do containers communicate on a custom network?
Containers on the same Docker network communicate using container names as hostnames.

### docker compose down -v vs docker compose down
`docker compose down` removes containers and networks.  
`docker compose down -v` also removes associated volumes.

### Why are multi-stage builds useful?
They reduce image size by separating build dependencies from the final runtime image.

### COPY vs ADD
COPY copies files from host to container.  
ADD can also extract tar files and download URLs.

### What does -p 8080:80 mean?
Maps host port 8080 to container port 80.

### How to check Docker disk usage?
docker system df