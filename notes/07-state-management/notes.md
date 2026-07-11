# Domain 7: Implement and Maintain State

> **Exam Weight:** 12–15% (HIGHEST PRIORITY) | **Practice:** [60 Questions](../../questions/07-state-management/questions.md) | **Example:** [state-and-backends](../../examples/07-state-management/state-and-backends/)

---

## Why State Exists

| Purpose | Explanation |
|---------|-------------|
| **Mapping** | Links config names to real-world resource IDs |
| **Metadata** | Tracks dependencies between resources |
| **Caching** | Stores resource attributes for performance |
| **Collaboration** | Remote state enables team sharing |

Without state, Terraform wouldn't know what it already manages.

---

## State File Facts

- Default location: `terraform.tfstate` (local backend)
- Contains resource IDs, attributes, metadata
- **Stores sensitive data in PLAINTEXT** — always encrypt at rest
- **NEVER commit to version control**

---

## Local vs Remote Backend

| | Local Backend | Remote Backend |
|--|---------------|----------------|
| Storage | `terraform.tfstate` on disk | S3, Azure Blob, GCS, HCP Terraform |
| Locking | No native locking | Yes (e.g., DynamoDB for S3) |
| Collaboration | Poor (file sharing) | Excellent (shared remote state) |
| Default | Yes | Must configure |

---

## Remote Backend Configuration (S3 Example)

```hcl
terraform {
  backend "s3" {
    bucket         = "my-terraform-state"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"    # State locking
  }
}
```

**Backend changes** require: `terraform init -migrate-state`

---

## State Locking

Prevents two people from running `apply` simultaneously.

- S3 backend uses **DynamoDB** for locking
- If lock is stuck: `terraform force-unlock <LOCK_ID>`
- Without locking, concurrent applies can **corrupt state**

---

## State Commands

```bash
terraform state list                          # List all resources
terraform state show aws_instance.web         # Show resource details
terraform state mv old_addr new_addr          # Rename in state (no destroy)
terraform state rm aws_instance.web           # Remove from state ONLY
terraform state pull                          # Download remote state
terraform state push                          # Upload state (DANGEROUS!)
terraform state replace-provider old new      # Replace provider in state
```

### Critical Distinctions

| Command | Destroys Real Resource? |
|---------|------------------------|
| `terraform destroy` | **Yes** |
| `terraform state rm` | **No** — only removes from state |
| `terraform state mv` | **No** — renames in state |

**Exam favorite:** `state rm` = orphan resource (still exists in cloud, Terraform forgets it)

---

## Drift & Refresh

**Drift** = real infrastructure differs from state/config.

```bash
terraform plan -refresh-only     # Preview drift changes (PREFERRED)
terraform apply -refresh-only    # Apply drift reconciliation only
terraform refresh                  # DEPRECATED — use refresh-only
```

Refresh updates state to match real infrastructure without changing infrastructure.

---

## Inspection Commands

```bash
terraform show                     # Human-readable state
terraform show plan.tfplan           # Show saved plan
terraform show -json                 # JSON output
```

---

## `moved` Blocks vs `state mv`

Both refactor without destroy+recreate:

```hcl
# In configuration (preferred modern approach)
moved {
  from = aws_instance.old
  to   = aws_instance.new
}
```

```bash
# CLI equivalent
terraform state mv aws_instance.old aws_instance.new
```

---

## State Security Checklist

- [ ] Encrypt state at rest (S3 encrypt=true, HCP auto-encrypts)
- [ ] Restrict access to state files
- [ ] Use remote backend with locking
- [ ] Never commit state to Git
- [ ] Mark sensitive outputs with `sensitive = true`

---

## Exam Traps

| Trap | Truth |
|------|-------|
| State is encrypted by default locally | **No** — plaintext JSON |
| `state rm` deletes the cloud resource | **No** — only removes from state |
| `state push` is safe | **No** — can overwrite remote state dangerously |
| `terraform refresh` is preferred | **No** — use `plan/apply -refresh-only` |
| Backend creates cloud resources | **No** — backend stores state only |

---

## Self-Check Before Questions

- [ ] Know 4 reasons state exists?
- [ ] Can configure S3 backend with DynamoDB locking?
- [ ] Know all state subcommands?
- [ ] Know `state rm` vs `destroy`?
- [ ] Know refresh-only replaces deprecated refresh?
- [ ] Know `force-unlock` purpose?

**Ready?** → [Take the 60-question quiz](../../questions/07-state-management/questions.md)
