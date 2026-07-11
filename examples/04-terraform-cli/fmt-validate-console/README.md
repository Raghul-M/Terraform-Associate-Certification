# Domain 04 — Terraform CLI (Outside Core Workflow)

**Learning goal:** Useful CLI commands beyond init/plan/apply/destroy.

**Notes:** [notes/04-terraform-cli](../../../notes/04-terraform-cli/notes.md)  
**Questions:** [questions/04-terraform-cli](../../../questions/04-terraform-cli/questions.md)

## Commands to practice

| Command | Purpose |
|---------|---------|
| `terraform fmt` | Format HCL |
| `terraform validate` | Syntax/config check (needs init) |
| `terraform providers` | Show required providers |
| `terraform console` | Interactive expression evaluator |
| `terraform output` | Print outputs from state |
| `terraform show` | Show plan or state |
| `terraform force-unlock` | Unlock stuck remote state (advanced) |
| `terraform <cmd> -help` | Per-command help |

## Run

```bash
cd examples/04-terraform-cli/fmt-validate-console
terraform init
terraform apply -auto-approve
chmod +x commands.sh
./commands.sh
```

## Exam tip

`validate` checks configuration; `plan` compares config to state/real infrastructure.
