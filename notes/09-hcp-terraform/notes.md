# Domain 9: Understand HCP Terraform Capabilities

> **Exam Weight:** 8–10% | **Practice:** [60 Questions](../../questions/09-hcp-terraform/questions.md) | **Example:** [cloud-block](../../examples/09-hcp-terraform/cloud-block/)

---

## What is HCP Terraform?

**HCP Terraform** (formerly Terraform Cloud) is HashiCorp's managed platform for running Terraform at scale. It adds:

- Remote execution
- Team collaboration
- Encrypted state storage
- Policy enforcement (Sentinel)
- Private module registry
- VCS integration

Open-source Terraform CLI still works locally; HCP Terraform extends the workflow.

---

## `cloud {}` Block Configuration

```hcl
terraform {
  cloud {
    organization = "my-org"
    workspaces {
      name = "my-workspace"
    }
  }
}
```

Authenticate with: `terraform login`

---

## Workflow Types

| Workflow | How It Works |
|----------|--------------|
| **VCS-driven** | Connect Git repo → changes trigger plans automatically |
| **CLI-driven** | Run `terraform plan/apply` locally, execution happens remotely |
| **API-driven** | Trigger runs programmatically via API |

---

## Execution Modes

| Mode | Where Runs Execute |
|------|-------------------|
| **Remote** (default) | HCP Terraform infrastructure |
| **Local** | Your machine (state still in HCP) |
| **Agent** | Your self-hosted agents |

---

## HCP Workspaces vs CLI Workspaces

| | HCP Terraform Workspaces | CLI Workspaces |
|--|--------------------------|----------------|
| Scope | Separate state + config + variables | Same config, different state files |
| Management | Web UI / API | `terraform workspace` commands |
| Variables | Stored in HCP (Terraform + env vars) | Passed via tfvars/flags |
| Collaboration | Full team features | Limited |

**Exam trap:** These are completely different concepts despite the same name.

---

## State in HCP Terraform

- Stored and **encrypted automatically**
- No need to configure S3 backend manually
- Locking built-in
- Migrate existing state: follow HCP migration guide

---

## Variables in HCP Terraform

Two types:
1. **Terraform variables** — passed to `var.*` in configuration
2. **Environment variables** — e.g., `AWS_ACCESS_KEY_ID`, `TF_LOG`

Both support **sensitive** flag to hide values in UI.

**Variable sets** can be shared across multiple workspaces.

---

## Sentinel (Policy as Code)

- HashiCorp's policy framework
- Policies evaluated **between plan and apply**
- Available in Team & Governance tier

| Policy Type | Behavior |
|-------------|----------|
| **Advisory** | Warns but allows apply |
| **Hard-mandatory** | Blocks apply if policy fails |

---

## Other HCP Features

| Feature | Description |
|---------|-------------|
| **Run triggers** | One workspace triggers another after apply |
| **Private registry** | Host modules/providers for your org |
| **Cost estimation** | AWS, Azure, GCP cost preview in plan |
| **Drift detection** | Detect when real infra differs from state |
| **Teams & governance** | RBAC, audit logs, policy enforcement |
| **Projects** | Organize workspaces into groups |

---

## Free Tier

- Up to **500 managed resources**
- Remote operations, state storage, VCS integration

---

## CLI Commands for HCP

```bash
terraform login       # Authenticate with HCP Terraform
terraform init      # Initialize with cloud backend
terraform plan        # Plan runs remotely (in remote mode)
terraform apply       # Apply runs remotely
terraform logout      # Remove stored credentials
```

---

## When to Use HCP Terraform

Use when you need:
- Centralized remote runs (not on individual laptops)
- Shared state with team access controls
- Policy checks before apply
- VCS-driven workflow with approvals
- Private module registry
- Audit trail and governance

---

## Exam Traps

| Trap | Truth |
|------|-------|
| HCP workspaces = CLI workspaces | **No** — completely different |
| Sentinel runs after apply | **No** — between plan and apply |
| HCP Terraform replaces open-source Terraform | **No** — extends it |
| Cost estimation works for all providers | **No** — AWS, Azure, GCP only |
| State in HCP is unencrypted | **No** — encrypted automatically |

---

## Self-Check Before Questions

- [ ] Know `cloud {}` block syntax?
- [ ] Know 3 workflow types?
- [ ] Know 3 execution modes?
- [ ] Know HCP vs CLI workspaces difference?
- [ ] Know when Sentinel policies run?
- [ ] Know advisory vs hard-mandatory policies?
- [ ] Know `terraform login`?

**Ready?** → [Take the 60-question quiz](../../questions/09-hcp-terraform/questions.md)
