# Domain 02 — Provider-Agnostic Terraform

**Learning goal:** Terraform provisions via providers and is not locked to one cloud.

**Notes:** [notes/02-terraform-purpose](../../../notes/02-terraform-purpose/notes.md)  
**Questions:** [questions/02-terraform-purpose](../../../questions/02-terraform-purpose/questions.md)

## Terraform vs other tools

| Tool | Focus | Scope |
|------|--------|--------|
| **Terraform** | Infrastructure provisioning | Multi-cloud, declarative HCL |
| **Ansible** | Configuration management | Procedural, agentless SSH |
| **CloudFormation** | AWS IaC | AWS-only, JSON/YAML |
| **Pulumi** | IaC with general languages | Multi-cloud, code-first |

This example uses `random` + `local` providers — same `init` / `plan` / `apply` pattern as AWS/Azure.

## Run

```bash
cd examples/02-terraform-purpose/provider-agnostic
terraform init
terraform apply -auto-approve
```

## Exam tip

Terraform = **provisioning** + **provider plugins** + **declarative**. Ansible is mainly **configuration management**.
