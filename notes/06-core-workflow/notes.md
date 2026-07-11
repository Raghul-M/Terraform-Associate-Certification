# Domain 6: Use the Core Terraform Workflow

> **Exam Weight:** 8–10% | **Practice:** [60 Questions](../../questions/06-core-workflow/questions.md) | **Example:** [init-plan-apply](../../examples/06-core-workflow/init-plan-apply/)

---

## The Core Workflow

```
Write → Init → Validate → Format → Plan → Apply
```

1. **Write** — Create/edit `.tf` configuration files
2. **Init** — Download providers, modules, configure backend
3. **Validate** — Check syntax and internal consistency
4. **Format** — Standardize code style
5. **Plan** — Preview changes (NO changes made)
6. **Apply** — Execute changes

### Who runs the workflow?

| Mode | How it works |
|------|----------------|
| **Individual** | Write locally → plan → apply from your machine |
| **Team** | Checkout shared VCS code → plan/apply with shared remote state |
| **HCP Terraform** | VCS or CLI-driven remote runs; state and collaboration in the cloud |

---

## `terraform init`

Initializes a working directory.

```bash
terraform init                    # Standard init
terraform init -upgrade           # Upgrade providers to latest allowed versions
terraform init -migrate-state     # Reconfigure backend and migrate state
```

**Does:** Downloads providers/modules, sets up backend, creates `.terraform/`

**Exam trap:** Backend config changes require `terraform init -migrate-state`

---

## `terraform validate` vs `terraform fmt`

| Command | Purpose | Changes Files? |
|---------|---------|----------------|
| `terraform validate` | Check syntax and internal consistency | No |
| `terraform fmt` | Format to canonical HCL style | Yes |
| `terraform fmt -check` | Check formatting (CI-friendly, exit 0/3) | No |
| `terraform fmt -recursive` | Format subdirectories too | Yes |

**Exam traps:**
- `validate` does NOT check cloud API connectivity
- `fmt` only changes **style**, never **logic**

---

## `terraform plan`

Previews changes without applying them.

```bash
terraform plan                          # Preview changes
terraform plan -out=plan.tfplan           # Save plan to file
terraform plan -destroy                   # Preview destruction
terraform plan -refresh-only              # Preview drift reconciliation
terraform plan -replace=aws_instance.web  # Force replacement
```

### Plan Output Symbols (MEMORIZE THESE)

| Symbol | Meaning |
|--------|---------|
| `+` | Resource will be **created** |
| `-` | Resource will be **destroyed** |
| `~` | Resource will be **updated in-place** |
| `-/+` | Resource will be **destroyed and re-created** (replacement) |
| `<=` | **Data source** will be read |

---

## `terraform apply`

```bash
terraform apply                         # Apply (prompts for confirmation)
terraform apply plan.tfplan               # Apply saved plan (no prompt)
terraform apply -auto-approve           # Skip confirmation (dangerous in prod!)
terraform apply -target=aws_instance.web # Apply specific resource only
terraform apply -var="name=value"        # Pass variable inline
terraform apply -var-file="prod.tfvars"  # Use variable file
terraform apply -destroy                # Destroy all (like terraform destroy)
terraform apply -refresh-only           # Apply refresh only
```

**Exam traps:**
- `plan` does NOT make changes
- `-auto-approve` skips review — dangerous in production
- `-target` is for **exceptional use only** (can cause inconsistencies)
- Saved plan: `plan -out` then `apply plan.tfplan` ensures exact execution

---

## `terraform destroy`

```bash
terraform destroy                       # Destroy all managed infrastructure
terraform destroy -auto-approve         # No confirmation
terraform destroy -target=aws_instance.web # Destroy specific resource
```

`terraform apply -destroy` achieves similar result to `terraform destroy`.

---

## Safe Production Workflow

```
fmt → validate → plan → REVIEW → apply
```

Never skip plan review. Never use `-auto-approve` in production without safeguards.

---

## Variable Passing at Apply Time

```bash
terraform apply -var="instance_type=t3.large"
terraform apply -var-file="production.tfvars"
```

---

## Self-Check Before Questions

- [ ] Know what each init flag does?
- [ ] Know validate vs fmt difference?
- [ ] Know all plan symbols (+, -, ~, -/+, <=)?
- [ ] Know plan does NOT change infrastructure?
- [ ] Know saved plan workflow?
- [ ] Know why -auto-approve is dangerous?
- [ ] Know -target is exceptional use only?

**Ready?** → [Take the 60-question quiz](../../questions/06-core-workflow/questions.md)
