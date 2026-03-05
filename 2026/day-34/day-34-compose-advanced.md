# Day 34 – Docker Compose Advanced

## Stack
Flask App + MySQL + Redis

## Features Tested

- Multi container stack
- Custom Dockerfile build
- Healthchecks
- depends_on with service_healthy
- Restart policies
- Named volumes
- Custom networks
- Scaling with compose

## Restart Policy Notes

restart: always  
Used for critical services like databases.

restart: on-failure  
Useful for batch jobs or scripts.

## Scaling Observation

Scaling web containers fails with port mapping because multiple containers cannot bind to the same host port.

Solution in production: Load balancer or reverse proxy.
















Docker assumes: “The human intentionally stopped this container.”
So it does not restart it immediately, even with restart: always.
The restart policy mainly triggers when:
• the container crashes on its own
• the Docker daemon restarts
• the host machine reboots

Restart Policy Differences
restart: always
Container always restarts even after reboot.