# Domain 5: Interact with Terraform Modules

> **Exam Weight:** 8–10% | **Practice:** [60 Questions](../../questions/05-modules/questions.md) | **Example:** [local-file-module](../../examples/05-modules/local-file-module/)

---

## What is a Module?

A **module** is a container for multiple resources used together. Modules enable **reusability**, **organization**, and **encapsulation**.

Every Terraform configuration has at least one module — the **root module** (the directory where you run `terraform` commands).

---

## Module Structure

```
modules/
└── vpc/
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    └── README.md
```

---

## Using a Module

```hcl
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr    = "10.0.0.0/16"
  environment = "prod"
}

# Access outputs
resource "aws_instance" "web" {
  subnet_id = module.vpc.public_subnet_id
}
```

**Output reference syntax:** `module.<name>.<output>`

---

## Module Sources

| Source Type | Example |
|-------------|---------|
| Local path | `source = "./modules/vpc"` |
| Terraform Registry | `source = "terraform-aws-modules/vpc/aws"` |
| GitHub | `source = "github.com/org/repo//modules/vpc"` |
| Generic Git | `source = "git::https://example.com/repo.git"` |
| S3 | `source = "s3::https://s3.amazonaws.com/bucket/vpc.zip"` |

**Registry format:** `namespace/name/provider` (e.g., `terraform-aws-modules/vpc/aws`)

**Registry naming convention:** `terraform-<PROVIDER>-<NAME>`

---

## Registry Module with Version Pinning

```hcl
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"    # ALWAYS pin versions!

  name = "my-vpc"
  cidr = "10.0.0.0/16"
}
```

`version` argument only works for **registry modules**, not local paths.

---

## Root vs Child Modules

| | Root Module | Child Module |
|--|-------------|--------------|
| Location | Where you run `terraform` | Called via `module` block |
| Contains | Full configuration | Reusable resource group |
| State | Owns the state file | Resources tracked in root's state |

---

## Variable Scope in Modules

- Variables declared **inside** a module are **NOT** accessible outside
- Must expose values via **`output`** blocks
- Pass values **into** modules via module block arguments

```hcl
# Child module outputs.tf
output "vpc_id" {
  value = aws_vpc.main.id
}

# Root module — access it
module.vpc.vpc_id
```

---

## Provider Inheritance

**Child modules do NOT automatically inherit provider configurations** from the root module.

Pass providers explicitly using `providers` argument or `configuration_aliases`.

---

## Module Download Commands

| Command | What It Does |
|---------|--------------|
| `terraform init` | Downloads providers AND modules, sets up backend |
| `terraform get` | Downloads/updates modules only (no provider init) |

---

## Module Best Practices

1. **Pin versions** for registry modules
2. Keep modules **focused** (single responsibility)
3. Document inputs/outputs in README
4. Use **outputs** to expose needed values
5. Don't hardcode environment-specific values

---

## Exam Traps

| Trap | Truth |
|------|-------|
| Module variables are auto-accessible outside | **No** — need outputs |
| Child modules inherit providers | **No** — must pass explicitly |
| `version` works on local modules | **No** — registry only |
| `terraform get` initializes providers | **No** — modules only |
| Root module = any subdirectory | **No** — where you run terraform commands |

---

## Self-Check Before Questions

- [ ] Know root vs child module?
- [ ] Know all module sources?
- [ ] Can write module block with source and inputs?
- [ ] Can access outputs via `module.name.output`?
- [ ] Know to always pin registry versions?
- [ ] Know variable scope rules?

**Ready?** → [Take the 60-question quiz](../../questions/05-modules/questions.md)
