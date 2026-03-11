# Day 41 – Triggers & Matrix Builds
## Task 1: Trigger on Pull Request
### Steps Performed

Created a new branch

Added a commit

Pushed the branch to GitHub

Opened a Pull Request against main

[pr-check.yml file](https://github.com/fahadjaseem2/github-actions-practice/blob/main/.github/workflows/pr-check.yml)

**Result**
The workflow automatically triggered and appeared on the Pull Request page.

Screenshot: 

---

## Task 2 – Scheduled Trigger

GitHub Actions can run workflows automatically using cron syntax.

[cron file](https://github.com/fahadjaseem2/github-actions-practice/blob/main/.github/workflows/hello.yml)

**Example**
```
on:
  schedule:
    - cron: '0 0 * * *'
```

This workflow runs every day at midnight (00:00) UTC.


---

## Task 3 – Manual Workflow Trigger
### Steps Performed

1. Opened GitHub → Actions tab
2. Selected Manual Workflow
3. Clicked Run workflow
4. Entered environment value
**Example:**
production

Output:

Deploying to production

Screenshot: (Add manual workflow screenshot here)

---

## Task 4 – Matrix Builds

Matrix builds allow running the same job across multiple environments simultaneously.

[matrix file](https://github.com/fahadjaseem2/github-actions-practice/blob/main/.github/workflows/matrix.yml)


[matrix-extend file](https://github.com/fahadjaseem2/github-actions-practice/blob/main/.github/workflows/matrix_extend.yml)

**Key Learnings:**

Total Jobs Run: Initially, 2 OS × 3 Versions = 6 jobs. After excluding (Windows + Python 3.10), the total number of jobs executed was 5.

screenshot

---

## Task 5 – Exclude & Fail-Fast

Matrix configurations can exclude certain combinations.

**Excluded Combination**

windows-latest + Python 3.10

[matrix-extend file](https://github.com/fahadjaseem2/github-actions-practice/blob/main/.github/workflows/matrix_extend.yml)

### Fail-Fast Behavior
Default behavior:

fail-fast: true

If one job fails, GitHub cancels the remaining jobs.

When set to:

fail-fast: false

All remaining jobs continue running even if one fails.


screenshot