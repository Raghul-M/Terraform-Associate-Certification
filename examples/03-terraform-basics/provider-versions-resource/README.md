# Domain 03 — Providers, Versions, Resources

**Learning goal:** HCL project structure, `required_providers`, version constraints, resources.

**Notes:** [notes/03-terraform-basics](../../../notes/03-terraform-basics/notes.md)  
**Questions:** [questions/03-terraform-basics](../../../questions/03-terraform-basics/questions.md)

## Files

| File | Role |
|------|------|
| `versions.tf` | `terraform {}` + provider version pins |
| `main.tf` | Resource definitions |
| `outputs.tf` | Output values |
| `.terraform.lock.hcl` | Created by `init` — commit this |

## Version constraints (exam favorite)

| Constraint | Meaning |
|------------|---------|
| `= 5.0.0` | Exact |
| `>= 1.0` | Minimum |
| `~> 5.0` | 5.x only (not 6.0) |

## Run

```bash
cd examples/03-terraform-basics/provider-versions-resource
terraform init
terraform plan
terraform apply -auto-approve
```

## Exam tip

Commit `.terraform.lock.hcl`. Never commit `terraform.tfstate` or `.terraform/`.
