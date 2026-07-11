# Domain 08b — Dynamic Blocks

**Learning goal:** Generate repeated nested blocks with `dynamic` / `for_each`.

**Notes:** [notes/08-configuration](../../../notes/08-configuration/notes.md)  
**Questions:** [questions/08-configuration](../../../questions/08-configuration/questions.md)

This lab builds the same data shape as an `aws_security_group` with dynamic `ingress`/`egress` (commented AWS example in `main.tf`) and writes it to a local JSON file so you can run offline.

## Run

```bash
cd examples/08-configuration/dynamic-blocks
terraform init
terraform apply -auto-approve
cat generated/sg-rules.json
```

Try `-var='ingress_ports=[22,8080]'`.

## Exam tip

`dynamic` is for **nested blocks** inside a resource. Use `count` / `for_each` for **multiple resources**.
