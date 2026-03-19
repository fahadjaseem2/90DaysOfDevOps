# Day 46 – Reusable Workflows & Composite Actions
## What is a reusable workflow?

A reusable workflow is a GitHub Actions workflow that can be called by other workflows.

Instead of copying the same CI logic into multiple .yml files, you define it once and reuse it everywhere.

## What is the workflow_call trigger?
workflow_call is the event that allows a workflow to be called by another workflow.
```
on:
  workflow_call:
  ```

  **This means:**
  “This workflow does not run by itself — it runs only when another workflow calls it.”

  ## How is calling a reusable workflow different from using a regular action (uses:)?
  **Regular Action**
  Actions are single reusable steps.

  `actions/checkout@v4`

  This runs one predefined action.


  **Reusable Workflow**

  Reusable workflows are entire workflows, not just steps.

**In short:**

Action = tool

Reusable workflow = mini CI pipeline

## Where must a reusable workflow file live?

GitHub requires reusable workflows to live in a specific directory.

The file must be inside:

`.github/workflows/`

**Action hierarchy**

```
Step → Action
Job → Steps
Workflow → Jobs
Reusable Workflow → Reused Workflow
```

---


---

## ⚙️ Task 2: Reusable Workflow

📁 `.github/workflows/reusable-build.yml`

```yaml
name: Reusable Build Workflow

on:
  workflow_call:
    inputs:
      app_name:
        required: true
        type: string
      environment:
        required: true
        type: string
        default: staging
    secrets:
      docker_token:
        required: true

jobs:
  build:
    runs-on: ubuntu-latest

    outputs:
      build_version: ${{ steps.set_version.outputs.build_version }}

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Print build info
        run: echo "Building ${{ inputs.app_name }} for ${{ inputs.environment }}"

      - name: Check Docker token
        run: echo "Docker token is set: true"

      - name: Set version
        id: set_version
        run: |
          VERSION="v1.0-${GITHUB_SHA::7}"
          echo "build_version=$VERSION" >> $GITHUB_OUTPUT
```

---

## Task 3: Caller Workflow
```
name: Call Reusable Workflow

on:
  push:
    branches: [main]

jobs:
  build:
    uses: ./.github/workflows/reusable-build.yml
    with:
      app_name: "my-web-app"
      environment: "production"
    secrets:
      docker_token: ${{ secrets.DOCKER_TOKEN }}

  print_version:
    needs: build
    runs-on: ubuntu-latest

    steps:
      - name: Print build version
        run: echo "Build version is ${{ needs.build.outputs.build_version }}"
```

---

## Task 5: Composite Action

```
name: "Setup and Greet"

inputs:
  name:
    required: true
  language:
    required: false
    default: "en"

outputs:
  greeted:
    value: "true"

runs:
  using: "composite"
  steps:
    - name: Greeting
      run: |
        if [ "${{ inputs.language }}" = "en" ]; then
          echo "Hello ${{ inputs.name }}"
        elif [ "${{ inputs.language }}" = "hi" ]; then
          echo "Namaste ${{ inputs.name }}"
        else
          echo "Hello ${{ inputs.name }}"
        fi
      shell: bash

    - name: Print date and OS
      run: |
        echo "Date: $(date)"
        echo "Runner OS: $RUNNER_OS"
      shell: bash
```

### Using Composite Action

```
jobs:
  greet:
    runs-on: ubuntu-latest

    steps:
      - name: Run custom action
        uses: ./.github/actions/setup-and-greet
        with:
          name: Fahad
          language: en
```

## 📊 Task 6: Reusable Workflow vs Composite Action

| Feature | Reusable Workflow | Composite Action |
|--------|------------------|------------------|
| Triggered by | `workflow_call` | `uses:` in a step |
| Can contain jobs? | ✅ Yes | ❌ No |
| Can contain multiple steps? | ✅ Yes | ✅ Yes |
| Lives where? | `.github/workflows/` | `.github/actions/` |
| Can accept secrets directly? | ✅ Yes | ❌ No (via inputs only) |
| Best for | Full CI/CD pipelines | Small reusable logic |
