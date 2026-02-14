# Day 15 – Networking Concepts: DNS, IP, Subnets & Ports
## Task 1: DNS – How Names Become IPs
### What happens when you type google.com?

When you type google.com in a browser, your computer first checks its local DNS cache. If not found, it queries a recursive DNS resolver, which traverses the DNS hierarchy—starting from root servers, then TLD servers (.com), then authoritative name servers for google.com—until it receives the IP address. The browser then establishes a connection to that IP address to load the website.

### DNS Record Types
- A Record: Maps a domain name to an IPv4 address (e.g., 142.250.185.78)
- AAAA Record: Maps a domain name to an IPv6 address (e.g., 2607:f8b0:4004:800::200e)
- CNAME: Aliases one domain to another
- MX – Mail server responsible for receiving emails
- NS – Name servers responsible for the domain

`dig google.com `
**Output**

Screeshot
A Record: 172.253.115.113
TTL: 263 seconds

---

## Task 2: IP Addressing
### What is an IPv4 address?
An IPv4 address is a 32-bit numeric identifier written in dotted decimal format (e.g., 192.168.1.10).
It has four octets (8 bits each), ranging from 0–255.


### Public vs Private IP
Public IP – Routable on the internet (Example: 8.8.8.8)
Private IP – Used inside local networks (Example: 192.168.1.10)


### Private IP Ranges
10.0.0.0 – 10.255.255.255
172.16.0.0 – 172.31.255.255
192.168.0.0 – 192.168.255.255


`ip addr show`
All network interfaces + their IP addresses + their state.

Output

Screenshot

---

## Task 3: CIDR & Subnetting
### What does /24 mean in 192.168.1.0/24?
In 192.168.1.0/24, the first 24 bits are network bits.
That leaves 8 bits for hosts.

### Usable Hosts
/24 → 256 total IPs → 254 usable hosts

/16 → 65,536 total IPs → 65,534 usable hosts

/28 → 16 total IPs → 14 usable hosts

(Usable hosts = Total - 2 for network & broadcast)


### Why do we subnet?
Subnetting divides large networks into smaller logical networks.

It improves security, reduces broadcast traffic, and allows better IP management.


### CIDR Table:
| CIDR | Subnet Mask | Total IPs | Usable Hosts |
| :--- | :--- | :--- | :--- |
| /24 | 255.255.255.0 | 256 | 254 |
| /16 | 255.0.0.0 | 65,536 | 65,534 |
| /28 | 255.255.255.240 | 16 | 14 |
> Note: We subtract 2 from total IPs for the Network Address and the Broadcast Address.

---

## Task 4: Ports – The Doors to Services
### What is a port?
A port is a logical communication endpoint on a system.

It allows multiple services to run on one IP address.

| Port | Service | Purpose |
| :--- | :--- | :--- |
| 22 | SSH | Secure remote access |
| 80 | HTTP | Unencrypted web traffic |
| 443 | HTTPS | Encrypted web traffic |
| 53 | DNS | Domain name resolution |
| 3306 | MySQL | Database traffic |
| 6379 | Redis | In-memory data store |
| 27017 | MongoDB | NoSQL database |

`ss -tulpn`

Output

screenshot


## Task 5: Putting It Together
### curl `http://myapp.com:8080`

DNS resolves myapp.com to an IP.

The browser connects to that IP on port 8080.

Routing and TCP establish the connection before HTTP request is sent.

### App can’t reach database at 10.0.1.50:3306
First check if 10.0.1.50 is reachable (ping).

Then check if port 3306 is open (telnet or nc).

Also verify firewall and security group rules.


## What I Learned (Key Points)
DNS converts human-readable names into machine-usable IP addresses.

CIDR determines how many hosts exist inside a subnet.

Ports allow multiple services to operate on the same IP.