# Day 38 – YAML Basics

## Task 1: Key-Value Pairs

Created `person.yaml` describing basic information.

```yaml
name: Fahad Jaseem
role: DevOps Learner
experience_years: 1
learning: true
```

### Observation:
YAML uses key: value pairs.

No tabs allowed.

Clean indentation is required.

--- 

## Task 2: Lists



### Two ways to write lists in YAML:

Block Style

tools:

  -docker

  -kubernetes

Inline Style

tools: [docker, kubernetes]

---

### Task 3: Nested Objects

**Observation:**

YAML uses indentation to create nested structures

Incorrect indentation breaks the file

---

### Task 4: Multi-line Strings

Multi-line Strings – | vs >

 **| (literal block scalar)** – Preserves newlines exactly as written.

Useful for scripts, configuration files, or any text where line breaks matter.

 **> (folded block scalar)** – Folds newlines into spaces, turning multiple lines into a single line (unless an empty line indicates a new paragraph).

#Useful for long descriptive text that should be read as one line.

---

### Task 5: YAML Validation
**person.yml**

<img width="793" height="386" alt="Screenshot 2026-03-10 at 4 18 32 AM" src="https://github.com/user-attachments/assets/5521472b-9483-4b81-8813-5bda0c32e184" />

**server.yml**

<img width="794" height="477" alt="Screenshot 2026-03-10 at 4 19 57 AM" src="https://github.com/user-attachments/assets/21c3670c-e82d-42c6-9b35-8975c5dd23b8" />

**server.yml** fix error

<img width="804" height="383" alt="Screenshot 2026-03-10 at 4 17 53 AM" src="https://github.com/user-attachments/assets/6549c3f8-bc91-4437-8974-65bd834803b1" />


--- 

### Task 6: Spot the Difference

**Issue:**

The list item - docker is not properly indented under the tools key.


--- 

Key Learnings

YAML uses spaces only — tabs are not allowed.

Indentation defines structure in YAML.

Lists can be written using block style (- item) or inline style [item1, item2].

