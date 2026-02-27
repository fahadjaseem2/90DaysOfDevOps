# Day 31 – Dockerfile: Build Your Own Images
## Task 1: Your First Dockerfile
### step-1 Create directory and Create Dockerfile
`mkdir my-first-image`

`cd my-first-image`

`vim Dockerfile`

### Step 2: Create Dockerfile
```
FROM ubuntu:latest

RUN apt-get update && apt-get install -y curl

CMD ["echo", "Hello from my custom image!"]
```

### Step 3: Build image
`docker build -t my-ubuntu:v1 .`

### Step 4: Run container
`docker run my-ubuntu:v1`

**OUTPUT**

Screenshot

---

## Task 2: Dockerfile Instructions
### Create Dockerfile
```
FROM ubuntu:latest

RUN apt-get update && apt-get install -y nginx

WORKDIR /app

COPY index.html /app/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"] 
```

### Create index.html

### Build image
`docker build -t dockerfile-demo:v1 .`

### Run container
`docker run -p 8080:80 dockerfile-demo:v1`

**Explanation**

FROM → base image
RUN → install nginx
WORKDIR → sets working directory
COPY → copies index.html into container
EXPOSE → documents port 80
CMD → starts nginx server

---

## Task 3: CMD vs ENTRYPOINT
### CMD Example
```
FROM ubuntu
CMD ["echo", "hello"]
```

### Build
`docker build -t cmd-demo .`

### Run
`docker run cmd-demo`

`docker run cmd-demo echo "World"`

CMD can be overridden.


## ENTRYPOINT Example
```
FROM ubuntu
ENTRYPOINT ["echo"]
```
`docker build -t entrypoint-demo .`

`docker run entrypoint-demo hello world`

ENTRYPOINT **cannot** be overridden, arguments are appended.

CMD:

Used for default command

Can be overridden

ENTRYPOINT:

Used when container must always run specific command

Arguments are appended

---

## Task 4: Build Simple Web App Image

### Create index.html
### Create Dockerfile
```
FROM nginx:alpine

COPY index.html /usr/share/nginx/html/

EXPOSE 80
```

`docker build -t my-website:v1 .`

`docker run -p 8080:80 my-website:v1`

---

## Task 5: .dockerignore
### Create file .dockerignore
```
node_modules
.git
*.md
.env
```

### Purpose
Prevents unnecessary files from being included in image

**Benefits:**

Smaller image size

Faster build

Improved security

---

## Task 6: Build Optimization

## Layer Caching

- Docker builds images in layers. Each instruction in your Dockerfile creates a new layer.

- Why order matters: Docker caches layers. If you change a line, Docker must rebuild that layer and every layer after it.

- Optimization Tip: Place instructions that change infrequently (like installing OS packages or dependencies) at the top. Place things that change often (like your source code) at the bottom.

