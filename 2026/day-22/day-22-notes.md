# Day 22 Notes – Introduction to Git
## 1. Difference between git add and git commit

git add moves changes from working directory to staging area.

git commit saves staged changes permanently in the repository with a message.

git add = prepare changes  
git commit = save changes  

## 2. What does the staging area do? Why doesn't Git just commit directly?
The staging area acts like a preparation zone where we select which changes to include in the next commit.

Git uses staging so we can control exactly what gets committed instead of committing everything automatically.

This helps in creating clean and meaningful commits.

## 3. What information does git log show you?
git log shows:

Commit ID (hash) commit : 2c6c183dde82a7dfa564cb08cdb8229b315fc48f
Author name and email : Fahad Jaseem <fahadjaseem2@gmail.com>
Date and time of commit : Wed Feb 25 06:04:06 2026 +0530
Commit message :  adding day-22 git-coomand file

It shows the history of the project.

## 4. What is the .git/ folder and what happens if you delete it?
.git folder contains all Git data including:

commit history  
branches  
configuration  

Screenshot

If we delete the .git folder, the repository stops being a Git repository and all version history is lost permanently.


## 5. Difference between working directory, staging area, and repository
Working Directory:
Where files are created and edited

Staging Area:
Where changes are prepared before committing

Repository:
Where committed changes are permanently stored


Flow:

Working Directory → Staging Area → Repository