# Git Commands Reference
This file contains Git commands I am learning during my DevOps journey.

--- 

## Setup & Config
`git --version` or `git -v`

- If git is not installed

`sudo apt-get update`
`sudo apt install git`

### 2. git config --global user.name "Your Name"
What it does: Sets your Git username  
`git config --global user.name "Fahad Jaseem"`

### 2. git config --global user.email "Your Name"
What it does: Sets your Git email  
`git config --global user.email "fahadjaseem2@gmail.com"`

>`do not submit your GitHub username in Git config. Git uses your name and email, not your username, to identify commits.`

### 4. git config --global --list
Shows current Git configuration 

--- 

## Basic Workflow
### 5. git init
What it does: Initializes a new Git repository

### 6. git status
What it does: Shows current repository status  

### 7. git add <file>
What it does: Adds file to staging area  
`git add git-commands.md`

### 8. git add .
What it does: Adds all files to staging area  

### 9 git reset <file_name>
untrack a file

### 10. git commit -m "message"
What it does: Saves staged changes with a message 

---

## Viewing Changes
### 11. git log
What it does: Shows commit history 

### 12. git log --oneline
What it does: Shows commit history in short format  

### 13. git diff
`git diff --staged`

What it does: Shows staged changes 

---



