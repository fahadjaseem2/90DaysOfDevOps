# Day 14 – Networking Fundamentals & Hands-on Checks
## Quick Concepts
### OSI vs TCP/IP
- OSI (7 Layers): A conceptual framework. Physical, Data Link, Network, Transport, Session, Presentation, Application.
- TCP/IP (4 Layers): The practical implementation. Link, Internet, Transport, Application.

### Protocol Positions
- **IP**: Internet Layer (OSI Layer 3)
- **TCP/UDP**: Transport layer (OSI Layer 4)
- **HTTP/HTTPS/DNS**: Application Layer (OSI Layer 7)

**Real-world Example**: curl https://google.com This initiates an Application layer request (HTTP), wrapped in a Transport layer segment (TCP), addressed via the Internet layer (IP).

## Hands-on Checklist
- Identity: hostname -I 

*Output*

`172.31.7.78 172.17.0.1`

- Reachability: ping google.com

*Output*

screenshot

- Path: traceroute google.com

*output* 

screenshot

- Ports: ss -tulpn

*output*

screenshot

- Name resolution: dig google.com

*output*

screenshot 

- HTTP check: curl -I https://google.com

*output*

screenshot 

- Connections snapshot: netstat -an | head 

*output*

screenshot


## Mini Task: Port Probe & Interpret
1. Identify Port: Running ss -tulpn shows 0.0.0.0:22 (SSH) is listening.

2. Test Port: Command: nc -zv localhost 22

Output: Connection to localhost 22 port [tcp/ssh] succeeded!

3. Interpretation: The port is reachable. If this had failed, my next check would be systemctl status ssh to see if the service crashed, followed by sudo ufw status to check for firewall blocks.


## Reflection
Fastest Signal When Something Breaks
 ping — immediately tells you if the host is reachable at all.