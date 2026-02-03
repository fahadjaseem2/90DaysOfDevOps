# Day 09 Challenge
## Task 1. Create Users

`sudo useradd -m tokyo -s /bin/bash`

`sudo passwd tokyo`

create three user with home directory and password 
- tokyo
- berlin
- professor

### check user is created as well as their home directory.
`cat /etc/passwd`

attach screenshot 

`getent passwd tokyo` or `echo ~tokyo`

getent = Get Entiries = shows **User ID**, **Group ID**, **Home directory**, **Login Shell**

attach screenshot 


## Task 2. Create Group
`sudo groupadd developers`
`sudo groupadd admin`

### check
`cat /etc/group`

attach screenshot


## Task 3. Assign User to Group
Adding users **tokyo** and **berlin** to group **developers**.

`sudo usermod -aG developers tokyo berlin`

Adding user **professor** to **admin** group.

`sudo usermod -aG  admin professor`

attach screenshot


## Task 4. Shared Directory

` sudo mkdir /opt/dev-project`

Cretaing directory on root directory

`ls -l /opt`

attach screenshot

`sudo chown root:developers /opt/dev-project`
Change group ownership from **root** to **developers**

attach screenshot

`sudo chmod 775 /opt/dev-project`

attach screenshot

The /dev-project directory is accessible to users **tokyo** and **berlin**, and both users have permission to create files within the directory.

attach screenshot

---
## Task 5. Team Workspace
Creating user nairobi with home directory

`sudo useradd -m nairobi -s /bin/bash`

Creating group project-team

`sudo groupadd project-team`

Adding **nairobi** and **tokyo** to project-team

`sudo usermod -aG project-team nairobi tokyo`

Create /opt/team-workspace directory

`sudo mkdir /opt/team-workspace`

Set group to project-team, permissions to 775
`sudo chown root:project-team /opt/team-workspace && sudo chmod 775 /opt/team-workspace`

Testing by creating file as nairobi

