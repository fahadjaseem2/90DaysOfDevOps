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

<img width="570" height="88" alt="Screenshot 2026-02-03 at 5 41 25 AM" src="https://github.com/user-attachments/assets/49294049-4c50-4660-94da-0e0ed280937a" />


`getent passwd tokyo` or `echo ~tokyo`

getent = Get Entiries = shows **User ID**, **Group ID**, **Home directory**, **Login Shell**

<img width="570" height="76" alt="Screenshot 2026-02-03 at 5 45 43 AM" src="https://github.com/user-attachments/assets/68327d85-6557-45cf-ab88-d8cc772a0ede" />



## Task 2. Create Group

`sudo groupadd developers`

`sudo groupadd admin`

### check
`cat /etc/group`

<img width="577" height="65" alt="Screenshot 2026-02-03 at 6 04 13 AM" src="https://github.com/user-attachments/assets/30680170-8ca8-4d78-a8bf-a9c02881db6f" />



## Task 3. Assign User to Group

### Adding users **tokyo** and **berlin** to group **developers**.

`sudo usermod -aG developers tokyo berlin`

### Adding user **professor** to **admin** group.

`sudo usermod -aG  admin professor`

<img width="577" height="65" alt="Screenshot 2026-02-03 at 6 04 13 AM" src="https://github.com/user-attachments/assets/324718d1-d2a1-4ad6-a7c2-8f388f9f7eb7" />



## Task 4. Shared Directory

` sudo mkdir /opt/dev-project`

### Cretaing directory on root directory

`ls -l /opt`

<img width="567" height="58" alt="Screenshot 2026-02-03 at 6 18 09 AM" src="https://github.com/user-attachments/assets/f8fc1bf3-14fc-4ee7-9b30-28828b11a0ac" />


`sudo chown root:developers /opt/dev-project`

### Change group ownership from **root** to **developers**

<img width="568" height="73" alt="Screenshot 2026-02-03 at 6 24 17 AM" src="https://github.com/user-attachments/assets/82cc4e57-f209-430d-996c-91e8d72827dc" />


`sudo chmod 775 /opt/dev-project`

<img width="567" height="76" alt="Screenshot 2026-02-03 at 6 26 03 AM" src="https://github.com/user-attachments/assets/80185de6-cb97-4d33-9624-2939239356c6" />


### The /dev-project directory is accessible to users **tokyo** and **berlin**, and both users have permission to create files within the directory.

<img width="573" height="75" alt="Screenshot 2026-02-03 at 6 36 37 AM" src="https://github.com/user-attachments/assets/4ce47c2d-7c31-4b46-bb99-52f160759303" />



## Task 5. Team Workspace

### Creating user nairobi with home directory

`sudo useradd -m nairobi -s /bin/bash`

<img width="574" height="32" alt="Screenshot 2026-02-03 at 2 46 50 PM" src="https://github.com/user-attachments/assets/9b5b0221-294b-4ee1-b7d8-2a76c0927016" />


### Creating group project-team

`sudo groupadd project-team`

### Adding **nairobi** and **tokyo** to project-team

`sudo usermod -aG project-team nairobi tokyo`

<img width="563" height="30" alt="Screenshot 2026-02-03 at 2 47 53 PM" src="https://github.com/user-attachments/assets/41195f8d-c9b9-47a9-aa2c-f07e9a52212e" />

### Create /opt/team-workspace directory

`sudo mkdir /opt/team-workspace`

### Set group to project-team, permissions to 775

`sudo chown root:project-team /opt/team-workspace && sudo chmod 775 /opt/team-workspace`

<img width="558" height="33" alt="Screenshot 2026-02-03 at 2 51 16 PM" src="https://github.com/user-attachments/assets/b37ac505-eaad-4c3b-998f-e77101dc33b9" />


### Testing by creating file as nairobi

<img width="563" height="61" alt="Screenshot 2026-02-03 at 2 52 03 PM" src="https://github.com/user-attachments/assets/0910f55e-ba19-4f9e-bf98-bfa91686ca10" />

---


# What I Learned
- How Linux users and group control access in multi-user environments
- Difference between user ownership and group permissions
- Importance of group-based access instead of individual permission



