# Day 39 – CI/CD Concepts
## Task.1
In a team of 5 developers manually pushing code to production, conflicts arise from simultaneous changes, leading to integration errors, broken builds, and downtime.
### The Problem with Manual Deployments
- **Human Error**: Forgetting a configuration step, clicking the wrong button, or deploying the wrong branch.
- **Environment Drift**: The staging server and production server diverge over time (e.g., different library versions, OS patches).
- **Merge Hell**: If developers only integrate code once a week, merging leads to massive, painful conflicts that take hours to resolve.

### What does "it works on my machine" mean?
This is the classic symptom of environment inconsistency. It usually happens because the developer's local machine has specific dependencies, global variables, or file paths that the production server lacks. It’s a real problem because it means the software isn't portable; it's fragile.

### Deployment Frequency:
In a purely manual environment, teams often deploy once a week or even once a month. Why? Because manual deployment is high-risk and stressful. Fear dictates the frequency.

---

## Task 2: CI vs CD
### Continuous Integration (CI)
Continuous Integration is the practice of automatically building and testing code whenever developers push changes to a repository.

It helps detect bugs early and ensures new code integrates correctly with the existing codebase.

**Example**

A developer pushes code to GitHub →

GitHub Actions automatically runs tests →

If tests fail, the pipeline stops.

### Continuous Delivery (CD)
Continuous Delivery means that after CI passes, the application is automatically prepared for deployment.

The software is always in a deployable state, but a human usually approves the final deployment.

**Example**

Code passes tests →

Docker image is built →

Image is pushed to Docker Hub →

Ready for manual deployment to production.

### Continuous Deployment
Continuous Deployment goes one step further.

If all tests pass, the application is automatically deployed to production without human intervention.

**Example**

Developer pushes code →

Tests run →

Docker image builds →

App automatically deploys to production.


---

## Task 3: Pipeline Anatomy

**Trigger**

The event that starts the pipeline. Examples: git push, a pull request being opened, a schedule (cron), or a manual click.

`on: push`

**Stage**

A logical grouping of jobs (e.g., Build, Test, Deploy). You don't move to the next stage unless the current one passes.

**Job**

A unit of work inside a stage. A stage can contain multiple jobs that might run in parallel (e.g., run unit tests on different OS versions).

**step**

Step: Single command or action inside a job, such as npm install or docker build.

**Runner**

Runner: Virtual machine or container executing jobs, like GitHub-hosted Ubuntu runners

- GitHub hosted runners
- Self-hosted runners

**Artifact**

Artifacts are files produced during the pipeline that can be used in later stages.

Examples:

- compiled binaries
- build logs
- Docker images
- Artifacts allow data to move between stages.

---

## Task 4: Draw a Pipeline


---

