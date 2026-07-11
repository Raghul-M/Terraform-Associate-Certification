# Domain 08d — Outputs and Sensitive Values

**Learning goal:** Outputs, references, and `sensitive = true`.

**Notes:** [notes/08-configuration](../../../notes/08-configuration/notes.md)  
**Questions:** [questions/08-configuration](../../../questions/08-configuration/questions.md)

## Run

```bash
cd examples/08-configuration/outputs-and-sensitive
terraform init
terraform apply -auto-approve
terraform output
terraform output -json   # includes sensitive values in JSON
```

## Exam tip

`sensitive = true` redacts CLI display; it does **not** encrypt state. State can still hold the value.
