# Day 45 – Docker Build & Push with GitHub Actions

## Overview

On Day 45, I built a **CI/CD pipeline using GitHub Actions and Docker**.  
The pipeline automatically builds a Docker image and pushes it to Docker Hub whenever code is pushed to the repository.

This simulates a real production workflow where container images are built and published automatically without manual intervention.

---

## Objective

- Automate Docker image builds using GitHub Actions
- Push Docker images to Docker Hub
- Tag images using both `latest` and commit SHA
- Ensure images are pushed **only from the main branch**
- Add a **workflow status badge** to the repository

---

## Workflow File

The GitHub Actions workflow file is located at:


.github/workflows/docker-publish.yml


*(The complete workflow configuration can be found in the file above.)*

---

## Docker Image

Docker image published to Docker Hub: https://hub.docker.com/repository/docker/fahadjaseem/docker-task35/general



The CI pipeline creates two tags for each build:


latest
sha-<commit-hash>


This allows tracking which commit generated a specific container image.

---

## Pipeline Trigger

The workflow runs automatically when:

- Code is pushed to the **main branch**
- Code is pushed to **feature branches** (build only)

However, Docker images are **only pushed when the branch is `main`**.

---

## Full Journey (Git Push → Running Container)

1. Developer pushes code to GitHub.
2. GitHub detects the push event.
3. GitHub Actions triggers the workflow.
4. A runner environment (`ubuntu-latest`) starts.
5. The repository code is checked out.
6. Docker builds the image using the project's Dockerfile.
7. The image is tagged with:
   - `latest`
   - `sha-<commit-hash>`
8. GitHub Actions logs into Docker Hub using repository secrets.
9. The image is pushed to Docker Hub.
10. The image can now be pulled and run on any machine.

---

## Pull and Run the Image

Pull the image from Docker Hub:
docker pull fahadjaseem/two-tier-flask


Run the container:
docker run -p 5000:5000 <dockerhub-username>/github-actions-practice:latest


The application should now be running locally inside a container.

---

## Status Badge

The workflow status badge added to `README.md`:


This badge shows the current build status of the pipeline.

---

## Pipeline Screenshot

Add a screenshot showing the successful GitHub Actions run.

Example location in GitHub:


---

## Key Learnings

- Automating Docker builds using GitHub Actions
- Secure authentication using GitHub Secrets
- Tagging Docker images with commit SHA
- Publishing container images to Docker Hub
- Understanding the full CI/CD pipeline for containerized applications

---

## Conclusion

This exercise demonstrates how modern DevOps pipelines automate the process of building and distributing container images.

With this setup, every code push can automatically produce a deployable Docker image, making deployments faster, reliable, and reproducible.

