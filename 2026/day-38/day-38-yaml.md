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

Screenshot

--- 

### Task 6: Spot the Difference

**Issue:**

The list item - docker is not properly indented under the tools key.


--- 

Key Learnings

YAML uses spaces only — tabs are not allowed.

Indentation defines structure in YAML.

Lists can be written using block style (- item) or inline style [item1, item2].

