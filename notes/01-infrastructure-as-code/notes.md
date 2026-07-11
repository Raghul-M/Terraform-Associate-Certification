# Domain 1: Understand Infrastructure as Code (IaC)

> **Exam Weight:** 5–7% | **Practice:** [60 Questions](../../questions/01-infrastructure-as-code/questions.md) | **Example:** [declarative-local-file](../../examples/01-infrastructure-as-code/declarative-local-file/)

---

## What is Infrastructure as Code?

**Infrastructure as Code (IaC)** is managing and provisioning infrastructure through machine-readable definition files instead of manual processes (ClickOps, SSH, console clicks).

You write configuration files → version control them → automate deployment.

---

## Why IaC Matters

| Benefit | What It Means |
|---------|---------------|
| **Version control** | Track every infrastructure change in Git |
| **Automation** | Deploy via CI/CD, not manual steps |
| **Consistency** | Same code → same result across dev/staging/prod |
| **Reusability** | Modules and templates reduce duplication |
| **Auditability** | Who changed what, when — full history |
| **Disaster recovery** | Rebuild infrastructure from code |

---

## Declarative vs Imperative

| | Declarative (Terraform) | Imperative |
|--|-------------------------|------------|
| You define | **Desired end state** | **Exact steps/commands** |
| Tool figures out | How to reach that state | N/A — you specify each action |
| Example | "I want 3 EC2 instances" | "Run create-instance API 3 times" |

**Terraform is declarative** — you describe *what* you want, not *how* to get there.

---

## Key Concepts (Exam Favorites)

### Idempotency
Running the same configuration multiple times produces the **same end state**. If infrastructure already matches the config, Terraform makes **no changes**.

### Immutable Infrastructure
Replace components rather than modify them in place. New instance replaces old one — don't patch running servers.

### Configuration Drift
When live infrastructure differs from your code (manual console changes, external events). Terraform `plan` detects drift.

### Desired State vs Current State
- **Desired state** = what you declare in `.tf` files
- **Current state** = what actually exists (tracked in `terraform.tfstate`)

Terraform **converges** current state toward desired state.

---

## IaC Best Practices

- Store config in **version control** (Git)
- Use **code review** (pull requests) for infrastructure changes
- Avoid **ClickOps** — manual console changes cause drift
- Treat config as **source of truth**
- Run `terraform plan` before `terraform apply`

---

## "Cattle Not Pets"

Servers should be **disposable and replaceable** (cattle), not unique irreplaceable machines (pets/snowflakes). IaC + immutable infrastructure supports this.

---

## IaC Anti-Patterns (Exam Traps)

| Anti-Pattern | Why It's Bad |
|--------------|--------------|
| Manual console changes without updating code | Causes drift |
| Hardcoded secrets in Git | Security risk |
| Skipping plan review | Risky in production |
| No version control | No audit trail |

---

## Quick Facts

- Terraform is **open source**, written in **Go**, by **HashiCorp**
- IaC applies **software engineering practices** to infrastructure
- Config files are **machine-readable** (HCL, JSON, YAML)
- IaC is a key enabler of **DevOps** and **GitOps**

---

## Self-Check Before Questions

- [ ] Can define IaC in your own words?
- [ ] Can list 4+ benefits of IaC?
- [ ] Can explain declarative vs imperative?
- [ ] Know what idempotency means?
- [ ] Know what immutable infrastructure means?
- [ ] Know what configuration drift is?

**Ready?** → [Take the 60-question quiz](../../questions/01-infrastructure-as-code/questions.md)
