# Day 23 – Git Branching & Working with GitHub
## Task 1: Understanding Branches
**What is a branch in Git?** A branch is essentially a pointer to a specific commit. It represents an independent line of development, allowing you to deviate from the main line to work on something specific.

**Why use branches instead of committing to main?**
It keeps the main branch clean and "production-ready." By using branches, multiple developers can work on different features or bug fixes simultaneously without interfering with each other's code.

**What is HEAD in Git?**
HEAD is a reference to the current checked-out commit or branch. It tells Git which snapshot you are currently working on.

**What happens to your files when you switch branches?**
Git updates your Working Directory to match the snapshot of the branch you switched to. Files created in one branch will disappear (or change) when you switch to a branch where those changes don't exist yet.

---

## Task 2: Branching Commands — Hands-On
List branches: 

`git branch`

Create a new branch called feature-1

`git branch feature-1` 

Switch to feature-1

`git switch feature-1`

Create and switch to feature-2 in one command

`git checkout -b feature-2` **OR** `git switch -c feature-2`  **-c = create**

**Difference between git switch and git checkout**

• git switch: Used only for switching branches

• git checkout: Used for switching branches and restoring files


Make a commit on feature-1

`git add <file_name>` staged the file

`git commit -m "refrence comment"`

Switch back to main

`git switch main`

Delete a branch

`git branch -d feature-2` **-d = delete , -D = force delete**

---

## Task 3: Push to GitHub





