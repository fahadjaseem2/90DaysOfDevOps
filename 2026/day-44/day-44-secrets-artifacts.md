# Day 44: Secrets, Artifacts & Real Tests in CI 🚀

## Project Overview
Today’s task focused on transitioning from basic "Hello World" GitHub Actions to functional pipelines that handle sensitive data, store build outputs, and execute real scripts.

---

## 🔐 Task 1 & 2: GitHub Secrets Management
I configured repository secrets to handle sensitive information without exposing them in the build logs.

### Key Learnings:
* **GitHub Masking:** When I tried to print `${{ secrets.MY_SECRET_MESSAGE }}` directly, GitHub automatically masked the output as `***`.
* **Security Best Practice:** Secrets should **never** be printed to logs because:
    1. Masking isn't 100% foolproof (especially with short strings).
    2. Logs are often exported to external monitoring tools where they might remain in plain text.
    3. Anyone with "Read" access to the repo can view historical logs.

**Environment Variables used:** `DOCKER_USERNAME`, `DOCKER_TOKEN`, and `MY_SECRET_MESSAGE`.

---

## 📦 Task 3 & 4: Artifacts & Inter-Job Transfer
I practiced saving files from one job and passing them to another. This is essential because every job in a workflow runs on a fresh runner (VM).

### Workflow Logic:
1. **Job 1 (Build):** Generated a `report.txt` file and used `actions/upload-artifact@v4`.
2. **Job 2 (Test):** Used `actions/download-artifact@v4` to retrieve that same file and verify its contents.

**Verification:**


---

## 🧪 Task 5: Running Real Tests
I integrated a functional script into the CI pipeline to ensure code quality before "deployment."

* **Script used:** [Mention your script name here, e.g., log_analyzer.sh]
* **Test Result:** * I intentionally broke the script (changed exit code to 1), and the pipeline turned **Red** 🔴.
    * After fixing the logic, the pipeline turned **Green** ✅.

**Passing Test Run:**


---

## ⚡ Task 6: Caching for Optimization
I implemented `actions/cache@v4` to speed up dependency installation.

### Results:
| Run Type | Time Taken | Status |
| :--- | :--- | :--- |
| First Run (No Cache) | [e.g., 45s] | Cache Miss |
| Second Run (With Cache) | [e.g., 8s] | Cache Hit |

### Notes on Caching:
* **What is cached?** The `~/.cache/pip` directory containing downloaded package binaries.
* **Where is it stored?** On GitHub’s dedicated cloud storage, mapped to a unique `key` based on the hash of my `requirements.txt`.

---

## 🧠 Reflection
Today I learned that a true DevOps pipeline isn't just about running commands; it's about **Security** (Secrets), **Persistence** (Artifacts), and **Efficiency** (Caching).

#TrainWithShubham #90DaysOfDevOps #DevOps