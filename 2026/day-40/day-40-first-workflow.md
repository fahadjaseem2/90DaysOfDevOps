# Day 40 – Your First GitHub Actions Workflow

## Workflow YAML

```yaml
name: Enhanced Hello Workflow

on: [push]

jobs:
  greet:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Print greeting
        run: echo "Hello from GitHub Actions!"
```


## Task 3: Anatomy of the Workflow

**Understanding these keywords is crucial for writing more complex pipelines later:**

**on:** - Defines the "event" that triggers the workflow (e.g., push, pull_request, or a schedule).

**jobs:** - A workflow is made up of one or more jobs. Each job runs in its own virtual environment instance.

**runs-on:** - Specifies the runner type (the operating system environment) where the job executes, such as ubuntu-latest, windows-latest, or macos-latest.

**steps:** - A sequence of tasks that execute commands. These run sequentially within the job.

**uses:** - Executes a pre-built action (like actions/checkout), which is essentially a reusable block of code.

**run:** - Executes specific shell commands (scripts) on the runner.

**name:** - A descriptive label for a job or step, making your logs readable.


## Task 4
## Workflow YAML

```yaml
name: Enhanced Hello Workflow

on: [push]

jobs:
  greet:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Print greeting
        run: echo "Hello from GitHub Actions!"

      - name: Show current date and time
        run: date

      - name: Show branch name
        run: echo "Branch name is ${{ github.ref_name }}"

      - name: List files in the repository
        run: ls -la

      - name: Show runner OS info
        run: uname -a
```