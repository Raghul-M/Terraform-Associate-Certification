# Terraform Examples

Runnable labs aligned with exam domains 01–09. Prefer `local` / `random` providers so you can learn offline.

**Auth:** Never hardcode cloud keys. If an example needs AWS later, use `AWS_PROFILE` or env vars only.

## How to run any lab

```bash
cd examples/<domain>/<lab>
terraform init
terraform plan
terraform apply -auto-approve
terraform destroy -auto-approve   # when finished
```

## Index

| Domain | Lab | Teaches |
|--------|-----|---------|
| 01 IaC | [declarative-local-file](01-infrastructure-as-code/declarative-local-file/) | Declarative + idempotent desired state |
| 02 Purpose | [provider-agnostic](02-terraform-purpose/provider-agnostic/) | Multi-provider, cloud-agnostic pattern |
| 03 Basics | [provider-versions-resource](03-terraform-basics/provider-versions-resource/) | `required_providers`, `~>`, project layout |
| 04 CLI | [fmt-validate-console](04-terraform-cli/fmt-validate-console/) | fmt, validate, console, output, show |
| 05 Modules | [local-file-module](05-modules/local-file-module/) | Root vs child, source, inputs/outputs |
| 06 Workflow | [init-plan-apply](06-core-workflow/init-plan-apply/) | init → plan `-out` → apply → destroy |
| 07 State | [state-and-backends](07-state-management/state-and-backends/) | State CLI + local/remote backend notes |
| 08 Config | [variables-and-types](08-configuration/variables-and-types/) | Variable types + precedence |
| 08 Config | [dynamic-blocks](08-configuration/dynamic-blocks/) | Dynamic nested blocks pattern |
| 08 Config | [count-vs-foreach](08-configuration/count-vs-foreach/) | count vs for_each |
| 08 Config | [outputs-and-sensitive](08-configuration/outputs-and-sensitive/) | Outputs + `sensitive` |
| 09 HCP | [cloud-block](09-hcp-terraform/cloud-block/) | `cloud {}` / remote workspace syntax |

## Study links

- Notes: [`../notes/README.md`](../notes/README.md)
- Questions: [`../questions/README.md`](../questions/README.md)
- Plan: [`../preparation.md`](../preparation.md)
