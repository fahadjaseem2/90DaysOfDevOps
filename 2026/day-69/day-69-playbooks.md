# Day 69 -- Ansible Playbooks and Modules

## What is a Playbook
```
An Ansible playbook is a YAML file that defines the desired state of systems. It allows you to automate tasks like installing packages, configuring services, and managing files.
Playbooks are idempotent, meaning you can run them multiple times and they will only make changes when required.
```

## Play vs Task
```
**Play**: Targets a group of hosts and defines what needs to be done on them.

**Task**: A single action performed on the hosts using a module.

👉 A play contains multiple tasks.
```

## Modules Used

- apt / yum → Install or remove packages
- service → Start, stop, enable services
- copy → Copy files from control node to managed nodes
- file → Create directories and manage permissions
- command → Run simple commands (no pipes or shell features)
- shell → Run commands with shell features (pipes, redirects)
- lineinfile → Add or modify a specific line in a file


## Handlers
```
Handlers are special tasks that run only when triggered by a notify.
They are mainly used to restart services only when configuration changes occur.
Example:
Config file changes → handler runs → service restarts
No change → handler does not run
This avoids unnecessary restarts and improves efficiency.
```

## Idempotency
```
Handlers are special tasks that run only when triggered by a notify.
They are mainly used to restart services only when configuration changes occur.
Example:
Config file changes → handler runs → service restarts
No change → handler does not run
This avoids unnecessary restarts and improves efficiency.
```

## Command vs Shell
```
Idempotency means running the same playbook multiple times produces the same result without making unnecessary changes.

First run → tasks show changed

Second run → tasks show ok

This ensures safe and predictable automation.
```


## Debugging Issues Faced
- Wrong config broke nginx
- Port 80 conflict with lighttpd
- Used lsof to debug

## Conclusion
Ansible ensures consistent and repeatable infrastructure...