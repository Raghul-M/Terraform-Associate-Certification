# Domain 06 — Core Terraform Workflow

**Learning goal:** Write → init → plan → apply → destroy (and saved plan files).

**Notes:** [notes/06-core-workflow](../../../notes/06-core-workflow/notes.md)  
**Questions:** [questions/06-core-workflow](../../../questions/06-core-workflow/questions.md)

## Workflow

```text
Write .tf files
      ↓
terraform init          # download providers, set up backend
      ↓
terraform plan -out=tfplan   # preview + save exact plan
      ↓
terraform apply tfplan  # apply the approved plan (no re-prompt for changes)
      ↓
terraform destroy       # tear down when done learning
```

## Run

```bash
cd examples/06-core-workflow/init-plan-apply
terraform init
terraform plan -out=tfplan
terraform apply tfplan
terraform destroy -auto-approve
```

## Exam tip

`terraform apply tfplan` applies the **saved plan**. Plain `terraform apply` re-computes a new plan.
