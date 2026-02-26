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

Create a new repository on GitHub (without README, .gitignore, or license).

`git remote add origin https://github.com/fahadjaseem2/devops-git-practice.git`

Push main branch

`git push -u origin main`

Push feature-1 branch

`git push -u origin feature-1`

### Difference between origin and upstream
origin:
The remote repository where you push your code (usually your GitHub repo).

upstream:
The original repository from which you pull updates (usually the source repo you forked).

---

## Task 4: Pull from GitHub
Pull changes from GitHub
`git pull origin main`

### Difference between git fetch and git pull
**git fetch:**

Downloads changes from remote

Git downloads commits, but does NOT merge them.

Your code is untouched. Git just updated its knowledge of the remote branch.

You can inspect safely: 
 `git log origin/main`

 or compare: 
 `git diff main origin/main`

 Only when YOU decide, you merge: 
 `git merge origin/main`

**git pull:**

Downloads AND merges changes automatically

Faster but less control

git pull = git fetch + git merge

---

## Task 5: Clone vs Fork

### Clone 
creates a copy of a repository on your local machine.

`git clone https://github.com/user/repo.git`

### What is fork?
Fork creates a copy of a repository in your GitHub account.

Used when contributing to other projects.

**Difference between clone and fork**

**Clone:**

•Local copy

•Git command

**Fork:**

•Copy on GitHub

•GitHub feature

**When to use clone vs fork**

**Clone:**

When working on your own repository

**Fork:**


**When contributing to someone else's repository**

After forking, how do you keep your fork in sync with the original repo?

Add the original as an upstream remote:

```
git remote add upstream https://github.com/original-owner/original-repo.git
git fetch upstream
git checkout main
git merge upstream/main
git push origin main
```

