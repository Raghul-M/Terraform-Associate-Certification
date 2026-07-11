# Domain 07 — State and Backends

**Learning goal:** What state stores, local vs remote backends, locking, state CLI.

**Notes:** [notes/07-state-management](../../../notes/07-state-management/notes.md)  
**Questions:** [questions/07-state-management](../../../questions/07-state-management/questions.md)

## Why state matters

Terraform stores resource IDs and attributes in state, then compares:

**config (desired)** ↔ **state (tracked)** ↔ **real world (optional refresh)**

Never commit `terraform.tfstate` — it can contain secrets.

## Practice commands (after apply)

```bash
cd examples/07-state-management/state-and-backends
terraform init
terraform apply -auto-approve

terraform state list
terraform state show local_file.alpha
# terraform state mv local_file.alpha local_file.alpha_renamed   # careful
# terraform state rm local_file.beta                             # unmanage only
```

## Backends

| Backend | Notes |
|---------|--------|
| Local (default) | `terraform.tfstate` in working dir |
| Remote (S3, etc.) | Team sharing + locking — see commented block in `versions.tf` |

## Exam tip

**Drift** = real infrastructure changed outside Terraform. Remote backends + locking prevent two people applying at once.
