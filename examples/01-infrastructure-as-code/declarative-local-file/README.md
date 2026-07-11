# Domain 01 — Declarative Local File

**Learning goal:** See Infrastructure as Code as declarative and idempotent.

**Notes:** [notes/01-infrastructure-as-code](../../../notes/01-infrastructure-as-code/notes.md)  
**Questions:** [questions/01-infrastructure-as-code](../../../questions/01-infrastructure-as-code/questions.md)

## Manual vs code

| Manual (ClickOps) | IaC (this example) |
|-------------------|--------------------|
| Create file by hand | Declare `local_file` in HCL |
| Easy to forget / drift | Desired state is in Git |
| Hard to repeat | `terraform apply` anywhere |

## Run

```bash
cd examples/01-infrastructure-as-code/declarative-local-file
terraform init
terraform apply -auto-approve
terraform apply -auto-approve   # second run → no changes (idempotent)
```

Change `app_name` (or `-var='app_name=demo'`) and apply again — Terraform updates in place.

Edit `generated/app.conf` by hand, then `terraform plan` — that is **configuration drift**.

## Exam tip

Terraform is **declarative**: you describe the end state, not step-by-step commands.
