# Domain 09 — HCP Terraform `cloud {}` Block

**Learning goal:** HCP Terraform (Terraform Cloud) capabilities and workspace config syntax.

**Notes:** [notes/09-hcp-terraform](../../../notes/09-hcp-terraform/notes.md)  
**Questions:** [questions/09-hcp-terraform](../../../questions/09-hcp-terraform/questions.md)

## What HCP Terraform adds

| Capability | Why it matters |
|------------|----------------|
| Remote state | Shared, secured state |
| Remote runs | Plan/apply in the cloud |
| VCS-driven workflow | Git push → run |
| Private registry | Share modules internally |
| Workspaces | Separate state per env |

## Run (local study mode)

`cloud {}` stays commented so this works offline:

```bash
cd examples/09-hcp-terraform/cloud-block
terraform init
terraform apply -auto-approve
```

To try real HCP: create an org/workspace, uncomment `cloud {}`, run `terraform login`, then `terraform init`.

## Exam tip

Workspaces in HCP Terraform = separate state. CLI `terraform workspace` is a different (local) feature — know both exist.
