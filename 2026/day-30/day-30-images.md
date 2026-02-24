# Day 30 – Docker Images & Container Lifecycle
## Task 1: Docker Images
`docker pull nginx`

`docker pull ubuntu`

`docker pull alpine`


### List All Images

`docker images`

<img width="574" height="74" alt="Screenshot 2026-02-24 at 8 09 43 AM" src="https://github.com/user-attachments/assets/d364268e-e958-4db8-8bb8-d6eb49f09a36" />


### Inspect an Image

`docker inspect nginx`

Information visible:
- Image ID : "sha256:5cdef4ac3335f68428701c14c5f12992f5e3669ce8ab7309257d263eb7a856b1",
- Created date: "2026-02-04T23:53:09.258787756Z",
- Architecture: "amd64",
- Environment variables: 
- Default command: "Entrypoint" "CMD"
- Layers:
- OS type:"linux"
- Port: "80"

### Remove an Image
`docker rmi ubuntu`

## Task 2: Image Layers
### View Image History
`docker image history nginx`

### What are Layers?
Each instruction in a Dockerfile (like RUN, COPY, or ADD) creates a new layer.
Each layer represents:
- Installing packages
- Copying files
- Running commands
Docker stacks these layers to create the final image.

## Task 3: Container Lifecycle
### Create Container (without starting)
`docker create --name my-nginx nginx`

### Start Container
`docker start my-nginx`

### Pause Container
`docker pause my-nginx`

### Unpause Container
`docker unpause my-nginx`

### Stop Container
`docker stop my-nginx`

### Restart Container
`docker restart my-nginx`

### Kill Container
`docker kill my-nginx`

### Remove Container
`docker rm my-nginx`

--- 

# Task 4: Working with Running Containers
### Run Nginx in Detached Mode
`docker run -d --name my-nginx-server -p 80:80 nginx`

verify

`docker ps`

<img width="577" height="119" alt="Screenshot 2026-02-24 at 8 55 08 AM" src="https://github.com/user-attachments/assets/0d2b0f31-3369-4997-a9ba-6f8c1377797f" />


### View Logs
`docker logs my-nginx-server`

### View Real-Time Logs
`docker logs -f my-nginx-server`  # -f = follow

### Exec into Container
`docker exec -it my-nginx-server bash `

### Explore filesystem:
`ls`
`cd /usr/share/nginx/index.html`

### Run Single Command Inside Container
`ls`

<img width="572" height="89" alt="Screenshot 2026-02-24 at 9 00 34 AM" src="https://github.com/user-attachments/assets/e2f4101c-126e-4b71-8975-dcb9651ed641" />


### Inspect Container
`docker inspect nginx-server`

Information visible:
- Container IP address:  "IPAddress": "172.17.0.2",
- Port mappings: "HostPort": "80"
- Mounts: 
- Status: "running"
- Network settings:

---

## Task 5: Cleanup
### Stop All Running Containers
`docker stop $(docker ps -q)`

### Remove All Stopped Containers
`docker rm $(docker ps -aq)`

### Remove Unused Images
`docker image prune -a`

### Check Docker Disk Usage
`docker system df`

<img width="572" height="105" alt="Screenshot 2026-02-24 at 9 12 05 AM" src="https://github.com/user-attachments/assets/1f1caec1-99cc-46ba-a90d-cae7489ea05d" />


---

## Key Learnings
- Images are templates used to create containers
- Containers are running instances of images
- Images are made of layers
- Layers improve performance and storage efficiency
- Containers have lifecycle states:
\- Created
\- Running
\- Paused
\- Exited
\- Removed
- Docker provides powerful tools to manage containers and images


