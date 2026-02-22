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

Screenshot

`docker run hello-world`

Screenshot

Docker checked local image if not available on local docker Pulled image from Docker Hub and Created container Ran it on terminal and Displayed message

---

## Task 3: Run Real Containers
