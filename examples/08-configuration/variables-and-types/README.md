# Domain 08a — Variables and Types

**Learning goal:** Variable types and precedence.

**Notes:** [notes/08-configuration](../../../notes/08-configuration/notes.md)  
**Questions:** [questions/08-configuration](../../../questions/08-configuration/questions.md)

## Variable precedence (highest → lowest)

1. `-var` / `-var-file` on the CLI  
2. `*.auto.tfvars`  
3. `terraform.tfvars`  
4. Environment `TF_VAR_name`  
5. Variable `default`

## Run

```bash
cd examples/08-configuration/variables-and-types
terraform init
terraform apply -auto-approve
terraform apply -var='vpc_name=cliname' -auto-approve
```

## Exam tip

Types: `string`, `number`, `bool`, `list`, `map`, `set`, `object`, `tuple`.
