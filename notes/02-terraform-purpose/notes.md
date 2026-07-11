# Domain 2: Understand the Purpose of Terraform (vs Other IaC)

> **Exam Weight:** 7–9% | **Practice:** [60 Questions](../../questions/02-terraform-purpose/questions.md) | **Example:** [provider-agnostic](../../examples/02-terraform-purpose/provider-agnostic/)

---

## What Terraform Does

Terraform is an **infrastructure provisioning** tool. It creates, updates, and destroys cloud/on-prem resources using a **declarative** approach and **HCL** (HashiCorp Configuration Language).

---

## Terraform vs Other Tools

| Tool | Primary Purpose | Approach | Scope |
|------|-----------------|----------|-------|
| **Terraform** | Infrastructure provisioning | Declarative (HCL) | Cloud-agnostic, multi-cloud |
| **Ansible** | Configuration management | Procedural/imperative | Agentless, configures existing servers |
| **CloudFormation** | AWS infrastructure | Declarative (JSON/YAML) | AWS only |
| **Pulumi** | Infrastructure provisioning | Declarative (real programming languages) | Multi-cloud |

---

## Terraform Strengths

1. **Cloud-agnostic** — 3000+ providers (AWS, Azure, GCP, Kubernetes, etc.)
2. **Declarative** — define desired state, Terraform plans the changes
3. **Provider-based architecture** — plugins talk to cloud APIs
4. **State management** — tracks what exists vs what you want
5. **Multi-cloud / hybrid cloud** — one workflow across platforms
6. **Open source** with enterprise option (HCP Terraform)

---

## When to Use What

| Scenario | Best Tool |
|----------|-----------|
| Provision VPC, EC2, S3 across clouds | **Terraform** |
| Install packages, configure nginx on a server | **Ansible** |
| AWS-only, native AWS integration | **CloudFormation** |
| Use TypeScript/Python for infra code | **Pulumi** |

**Exam trap:** Ansible configures existing servers; Terraform **provisions** infrastructure. They can complement each other.

---

## Provider vs Backend (Critical Distinction)

| Component | Responsibility |
|-----------|----------------|
| **Provider** | Talks to target platform API to create/manage resources |
| **Backend** | Defines **where state is stored** and how state operations are coordinated (locking) |

**Exam trap:** Provider does NOT store state. Backend does NOT create cloud resources.

---

## Multi-Cloud Advantages

- Single tool and workflow across AWS, Azure, GCP
- Consistent IaC patterns regardless of cloud
- Avoid vendor lock-in at the tooling level
- Hybrid cloud: manage on-prem + cloud together

---

## Terraform Architecture

```
Configuration (.tf files)
        ↓
   Terraform Core
        ↓
   Provider Plugins  →  Cloud APIs (AWS, Azure, etc.)
        ↓
   State File (tracks what exists)
```

- Written in **Go**
- **Plugin-based** — providers are separate binaries
- `terraform init` downloads providers

---

## What Terraform Does NOT Do

- Does NOT manage resources it didn't create (unless you **import** them)
- Does NOT configure software on servers (that's Ansible/chef — use provisioners only as last resort)
- Does NOT replace monitoring, logging, or security tools

---

## Exam Quick-Fire

| Statement | True/False |
|-----------|------------|
| Terraform is imperative | **False** — declarative |
| Terraform is AWS-only | **False** — cloud-agnostic |
| Ansible is for provisioning | **False** — configuration management |
| CloudFormation works on Azure | **False** — AWS only |
| Terraform uses HCL | **True** |
| Terraform is written in Python | **False** — Go |

---

## Self-Check Before Questions

- [ ] Can compare Terraform vs Ansible, CloudFormation, Pulumi?
- [ ] Know provider vs backend responsibilities?
- [ ] Know Terraform is cloud-agnostic and declarative?
- [ ] Know multi-cloud advantages?

**Ready?** → [Take the 60-question quiz](../../questions/02-terraform-purpose/questions.md)
