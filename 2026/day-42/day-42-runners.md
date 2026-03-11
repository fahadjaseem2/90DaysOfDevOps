# Day 42 – GitHub-Hosted & Self-Hosted Runners

## Task 1: GitHub-Hosted Runners on Three OSes
- Workflow file: [.github/workflows/multi-os.yml](https://github.com/fahadjaseem2/github-actions-practice/blob/main/.github/workflows/multi-os.yml)
- Screenshot showing three jobs running in parallel:
  !

**What is a GitHub-hosted runner? Who manages it?**  
A GitHub-hosted runner is a virtual machine provided and managed by GitHub that executes jobs in GitHub Actions. GitHub handles all infrastructure, updates, and maintenance. Users simply select the desired operating system (e.g., `ubuntu-latest`, `windows-latest`, `macos-latest`) and the job runs on a clean, ephemeral instance.

## Task 2: Explore Pre-installed Tools
- Added step to print Docker, Python, Node, Git versions.
- Screenshot of the job output:
  !

**Why does it matter that runners come with tools pre‑installed?**  
Pre‑installed tools save time and reduce complexity in workflows. You don’t need to write additional steps to install common software like Git, Docker, or language runtimes. This ensures faster execution, consistency across runs, and eliminates potential errors from manual installations. GitHub maintains these images, so you always get well‑tested versions.

## Task 3: Set Up a Self-Hosted Runner
- Runner registered on my local machine (Ubuntu VM).
- Screenshot of runner showing as **Idle** in GitHub settings:
  !

## Task 4: Use Your Self-Hosted Runner
- Workflow file: [.github/workflows/self-hosted.yml](https://github.com/fahadjaseem2/github-actions-practice/blob/main/.github/workflows/self-hosted.yml
)
- Screenshot of the job running on my machine:
  !
- After the run, file `demo-file.txt` was created on my machine – verified in the runner’s working directory.

## Task 5: Labels
- Added label `my-linux-runner` to my runner.
- Updated `runs-on: [self-hosted, my-linux-runner]` – job still picked up.

**Why are labels useful when you have multiple self‑hosted runners?**  
Labels allow you to route jobs to runners with specific characteristics. For example, you might have runners with different operating systems, hardware (GPU, high memory), or software configurations. By using labels in the `runs-on` field, you ensure that jobs are executed on the most suitable runner, improving reliability and resource utilisation.

## Task 6: GitHub-Hosted vs Self-Hosted

| Feature                | GitHub-Hosted                                          | Self-Hosted                                                      |
|------------------------|--------------------------------------------------------|------------------------------------------------------------------|
| Who manages it?        | GitHub                                                 | You (the user)                                                   |
| Cost                   | Free for public repos; included minutes for private    | Free (you pay for your own hardware)                             |
| Pre-installed tools    | Many popular tools already installed                   | Only what you install                                            |
| Good for               | Quick builds, standard environments, no maintenance    | Custom environments, private networks, cost saving for heavy usage |
| Security concern       | Code runs on shared GitHub infrastructure              | You must secure your own machine, avoid exposing secrets         |

