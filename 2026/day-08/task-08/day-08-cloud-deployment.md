# Cloud Deployment - AWS EC2 + Nginx
## Deployment Summary: Launched Ubuntu EC2 t2.micro (Free Tier), installed Nginx, exposed port 80, extracted logs. Public IP: 54.80.196.36:80

## Part 1. Launch & SSH
- Login AWS Console → EC2 → Launch Instance → Create Key pair.
- ssh -i "temp_key.pem" ubuntu@ec2-54-80-196-36.compute-1.amazonaws.com
<img width="576" height="454" alt="Screenshot 2026-02-01 at 7 50 49 PM" src="https://github.com/user-attachments/assets/fc51a48c-d51d-461f-bb6f-29fc168c130c" />


## Part 1. Install Nginx and Docker
`sudo apt update && sudo apt get upgrade -y`

`sudo apt install nginx -y`

`sudo systemctl status nginx`

`sudo systemctl enable --now nginx`

`curl localhost`

**Installing Docker**

`sudo apt install docker.io -y`

`sudo systemctl start docker`

`sudo systemctl enabled docker`


## part 3. Security Groups
- EC2 → Instance → Security Group → Edit Inbound: Type=HTTP(80)
- Browser: http://54.80.196.36:80 → Nginx welcome page.

<img width="561" height="215" alt="Screenshot 2026-02-01 at 8 44 44 PM" src="https://github.com/user-attachments/assets/adfacf40-c901-4f62-a9b4-6689e3310120" />



## part 4. Nginx Logs
`sudo cat /var/log/nginx/access.log | tail -n 50`

`sudo cat /var/log/nginx/error.log | tail -n 50`

`sudo tail -25 /var/log/nginx/access.log > ~nginx-logs.txt`


## Part 5. Download Log file to local
`scp -i "temp_key.pem" ubuntu@c2-54-80-196-36.compute-1.amazonaws.com:~/nginx-log.txt .`

---
## Challenge Faced
- Connection Timeout: forget to opened port **80** on AWS Security group.

---
## What I Learned
- `~` is home directory.
- Diffrence between **public IP**(for the world) and **private IP**(within the VPC).
- how nginx acts as a listner on port 80 to serve web content.
- `scp`(secure copy) moving data from remote to local.
