# Day 47 – Advanced Triggers: PR Events, Cron Schedules & Event-Driven Pipelines

## Task 1: Pull Request Event Types

Pull Request Lifecycle Workflow

Implemented a GitHub Actions workflow to understand **PR lifecycle events** and context variables.

---

## ⚙️ Workflow File

[📂 pr-lifecycle.yml](https://github.com/fahadjaseem2/github-actions-practice/blob/main/.github/workflows/pr-lifecycle.yml)

---

## 🚀 Trigger Events

```yaml
on:
  pull_request:
    types: [opened, synchronize, reopened, closed]

Screenshot 1
Screenshot 2

---

## Task 2: PR Validation Workflow

**Workflow file:** `.github/workflows/pr-checks.yml`

**Steps:**
1. Trigger on `pull_request` to the `main` branch.
2. **Job 1 – file-size-check:**
   - Check out code.
   - Find any file larger than 1 MB (excluding `.git`).
   - Fail the job if any such file exists.
3. **Job 2 – branch-name-check:**
   - Read the branch name (`${{ github.head_ref }}`).
   - Fail if it does not match pattern: `feature/*`, `fix/*`, or `docs/*`.
4. **Job 3 – pr-body-check:**
   - Read the PR body (`${{ github.event.pull_request.body }}`).
   - Print a warning (but do not fail) if the description is empty.
5. Test by opening a PR from a branch named `test-branch` (invalid) – the branch‑name‑check should fail.

**Expected output:** Failed branch‑name‑check prevents merging; large file detection fails if present; empty description shows a warning.

---

## Task 3: Scheduled Workflows (Cron Deep Dive)

**Workflow file:** `.github/workflows/scheduled-tasks.yml`

**Steps:**
1. Add two cron triggers:
   - `'30 2 * * 1'` – every Monday at 2:30 AM UTC
   - `'0 */6 * * *'` – every 6 hours
2. Include `workflow_dispatch` to allow manual testing.
3. In the job:
   - Print which schedule triggered (`${{ github.event.schedule }}`).
   - Perform a health check: `curl` a URL and check the response code.
4. Write in your notes:
   - The cron expression for every weekday at 9 AM IST.
   - The cron expression for the first day of every month at midnight.
   - Why GitHub may delay or skip scheduled workflows on inactive repos.

**Cron expressions:**
- **Every weekday at 9 AM IST:** `30 3 * * 1-5` (9 AM IST = 3:30 UTC)
- **First day of every month at midnight:** `0 0 1 * *`

**Why delays/skips:** GitHub may suspend scheduled workflows in repositories with no activity for a period to conserve resources. Always include `workflow_dispatch` for manual triggering.

---

## Task 4: Path & Branch Filters

**Workflow files:** `.github/workflows/smart-triggers.yml` and `.github/workflows/skip-docs.yml`

**Steps:**
1. **Smart triggers (paths):**
   - Trigger on `push` but only when files in `src/` or `app/` change.
   - Also filter branches: `main` and `release/*`.
2. **Skip docs (paths-ignore):**
   - Trigger on `push` but ignore `*.md` and `docs/**`.
3. Test:
   - Push a change to a `.md` file → the `skip-docs.yml` workflow should **not** run.
   - Push a change to `src/index.js` → both workflows (if on allowed branch) should run.

**When to use:**
- **`paths`:** Run workflow only when specific directories/files change (e.g., monorepo per-service tests).
- **`paths-ignore`:** Skip workflow for non‑code changes (e.g., docs, comments).

---

## Task 5: `workflow_run` – Chain Workflows Together

**Workflow files:** `.github/workflows/tests.yml` and `.github/workflows/deploy-after-tests.yml`

**Steps:**
1. Create `tests.yml` that runs on every push (e.g., echo “Running tests…”).
2. Create `deploy-after-tests.yml` that triggers on `workflow_run`:
   - `workflows: ["Run Tests"]` (must match the name in tests.yml)
   - `types: [completed]`
3. In the deploy workflow:
   - Add a job that runs only if the triggering workflow succeeded (`github.event.workflow_run.conclusion == 'success'`).
   - Add a job that runs only if it failed (prints a warning).
4. Verify: Push a commit → `tests.yml` runs first; after completion, `deploy-after-tests.yml` triggers and checks the conclusion.

---

## Task 6: `repository_dispatch` – External Event Triggers

**Workflow file:** `.github/workflows/external-trigger.yml`

**Steps:**
1. Create a workflow that listens to `repository_dispatch` with event type `deploy-request`.
2. In the job, print the client payload (`${{ github.event.client_payload.environment }}`).
3. Trigger it using the `gh` CLI (or `curl`):
   ```bash
   gh api repos/<owner>/<repo>/dispatches \
     -f event_type=deploy-request \
     -f client_payload='{"environment":"production"}'