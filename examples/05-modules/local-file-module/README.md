# Domain 05 — Local Module

**Learning goal:** Root vs child module, `source`, inputs, outputs.

**Notes:** [notes/05-modules](../../../notes/05-modules/notes.md)  
**Questions:** [questions/05-modules](../../../questions/05-modules/questions.md)

## Layout

```
local-file-module/          ← root module (where you run terraform)
├── main.tf                 ← module "app_config" { source = "./modules/config" }
├── versions.tf
└── modules/config/         ← child module
    ├── main.tf
    ├── variables.tf
    └── outputs.tf
```

Access child outputs: `module.app_config.file_path`

## Module sources (exam)

- Local: `./modules/config`
- Registry: `terraform-aws-modules/vpc/aws`
- Git: `git::https://github.com/org/repo.git`

## Run

```bash
cd examples/05-modules/local-file-module
terraform init
terraform apply -auto-approve
terraform output
```

## Exam tip

The directory where you run Terraform commands is always the **root module**.
