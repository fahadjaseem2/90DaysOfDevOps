# Day 71 — Roles, Templates, Galaxy and Vault

Today I learned how to organize Ansible automation using Roles, create dynamic configurations using Jinja2 Templates, install community roles from Ansible Galaxy, and securely manage secrets with Ansible Vault. :contentReference[oaicite:0]{index=0}

---

# What I Built

- Created a custom `webserver` role
- Used Jinja2 templates for dynamic nginx configs
- Installed Docker using `geerlingguy.docker`
- Used Ansible Vault to encrypt secrets
- Combined everything in a complete `site.yml`

---

# What I Learned

## Roles
Roles help organize automation into:
- tasks
- handlers
- templates
- defaults
- vars

This makes playbooks reusable and cleaner.

---

## Jinja2 Templates
Templates allow dynamic configuration generation using:
- variables
- host facts

I created:
- nginx.conf.j2
- vhost.conf.j2
- index.html.j2

---

## Galaxy Roles
I learned how to:
- search Galaxy roles
- install community roles
- use requirements.yml

Installed:
- geerlingguy.docker

---

## Ansible Vault
I learned how to:
- create encrypted files
- edit/view vault files
- use encrypted variables in playbooks

I also configured:
- `.vault_pass`
- `vault_password_file` in ansible.cfg

---

# Problems I Faced

## Inventory Issues
Initially, no hosts were detected because inventory file was not passed correctly.

Fix:
Used correct inventory path.

---

## Template Not Found
Faced errors with:
- index.html
- db-config.j2

Fix:
Corrected template paths.

---

## Role Not Found
Ansible could not detect:
- webserver role
- Galaxy role

Fix:
Configured:
- `roles_path = ./roles`

and installed Galaxy roles locally.

---

## Nginx Errors
Faced multiple nginx issues:
- invalid directives
- YAML syntax inside nginx configs
- wrong nginx user
- port 80 conflict with Apache

Fix:
- corrected templates
- changed user to `www-data`
- stopped Apache service
- validated configs using `nginx -t`

---

# Key Takeaways

- Roles make automation reusable
- Templates create dynamic configs
- Galaxy saves development time
- Vault secures secrets
- Debugging services/logs is an important DevOps skill

---

# Final Outcome

Successfully built a reusable Ansible role, deployed nginx dynamically, installed Docker using Galaxy, encrypted secrets with Vault, and debugged real infrastructure issues.

