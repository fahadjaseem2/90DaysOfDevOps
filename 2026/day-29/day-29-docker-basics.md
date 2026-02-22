# Day 29 – Introduction to Docker
## Task 1: What is Docker?
### What is a Container and Why Do We Need Them?
A container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another. It's essentially an isolated process on your machine.
We need containers because they solve the classic "it works on my machine" problem. They provide:
- Consistency: The app runs the same in development, testing, and production.
- Efficiency: They are lightweight and share the host OS kernel.
- Isolation: Apps run in isolated environments without interfering with each other.

### Containers vs Virtual Machines
|Aspect|Containers|Virtual Machine|
|---|---|---|
|Size|Lightweight(MB)|Heavy(GB)|
|Startup Time|Seconds|Minutes|
|OS Included|NO|YES|
|Performance|Near-native|Slower|
|Resources Usage|Low|High|

**Simple explanation:**

VM = Full house (includes its own OS)

Container = Apartment in same building (shares host OS)

### What is the Docker architecture? (daemon, client, images, containers, registry)

- **Docker Daemon** (dockerd): The "brain." It listens for API requests and manages Docker objects like images and containers.(Background services)

- **Docker Client** (docker): The tool you use to talk to the daemon (via the CLI),send command to docker deamon like `docker ps` , `docker run`.

- **Docker images** are blueprint of containers, read only template.

- **Docker Conatiner** is running instance of an Image.

- **Docker Registry** a storage and distribution system for Docker images. Docker Hub is the default public registry.

- **In my words** Client → API → Daemon (builds/runs containers from images) ↔ Registry (pull/push images). Daemon stores images/containers locally.

---

## Task 2: Install Docker

<img width="801" height="82" alt="Screenshot 2026-02-22 at 9 34 08 PM" src="https://github.com/user-attachments/assets/c72ccd87-fba7-4a12-af08-c02cad8e1212" />


`docker run hello-world`

<img width="782" height="186" alt="Screenshot 2026-02-22 at 9 38 33 PM" src="https://github.com/user-attachments/assets/ccde6c7f-e141-406e-a4e1-204c7063839c" />


Docker checked local image if not available on local docker Pulled image from Docker Hub and Created container Ran it on terminal and Displayed message

---

## Task 3: Run Real Containers
### Run Nginx Container
`docker run -d -p 80:80 --name my-nginx nginx`

- `-d` = detached mode
- `-p` = port mapping
- `-- name` = custom name

<img width="551" height="215" alt="Screenshot 2026-02-23 at 1 13 30 AM" src="https://github.com/user-attachments/assets/a33ed4eb-9239-4b5b-a9fc-c51dcc9b9ae1" />


### Run Ubuntu Container in Interactive Mode
`docker run -itd ubuntu`

`docker exec -it < container ID >`

<img width="583" height="266" alt="Screenshot 2026-02-23 at 1 13 14 AM" src="https://github.com/user-attachments/assets/940039e8-607c-4880-af38-2f228edda338" />


### List Running Containers
`docker ps`

<img width="575" height="121" alt="Screenshot 2026-02-23 at 1 14 23 AM" src="https://github.com/user-attachments/assets/8fe79027-8020-484f-bff3-4e468b0895e9" />


### List All Containers
`docker ps -a`

<img width="578" height="214" alt="Screenshot 2026-02-23 at 1 15 57 AM" src="https://github.com/user-attachments/assets/625a939c-cf04-44af-9b01-16568c5edf3c" />


### Stop and Remove Container and Image also
```
docker stop <conatiner ID> && docker remove <container ID>
docker rmi <Image ID>
```

<img width="580" height="91" alt="Screenshot 2026-02-23 at 1 36 15 AM" src="https://github.com/user-attachments/assets/10482600-e469-4720-ad5d-83a7714db299" />


---

## Explore Advanced Option 

### Check Logs
`docker logs <container ID> or <container name>`

<img width="565" height="185" alt="Screenshot 2026-02-23 at 1 39 14 AM" src="https://github.com/user-attachments/assets/1c860425-b236-464c-9873-f9a4d684ec98" />




