# Domain 8: Read, Generate, and Modify Configuration

> **Exam Weight:** 15–18% (HIGHEST WEIGHT) | **Practice:** [60 Questions](../../questions/08-configuration/questions.md) | **Examples:** [variables](../../examples/08-configuration/variables-and-types/) · [dynamic](../../examples/08-configuration/dynamic-blocks/) · [count/for_each](../../examples/08-configuration/count-vs-foreach/) · [outputs](../../examples/08-configuration/outputs-and-sensitive/)

This is the biggest exam domain. Covers resources, data sources, meta-arguments, variables, outputs, expressions, and functions.

---

## Resources vs Data Sources

### Resource — Creates/manages infrastructure
```hcl
resource "aws_instance" "web" {
  ami           = "ami-123456"
  instance_type = "t3.micro"
}
```

### Data Source — Reads existing infrastructure (no create/destroy)
```hcl
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
}

resource "aws_instance" "web" {
  ami = data.aws_ami.ubuntu.id    # Reference: data.<type>.<name>.<attr>
}
```

**Exam trap:** Data sources **read** info; they don't create resources. Plan shows `<=` for data sources.

---

## Resource Dependencies

### Implicit (Preferred)
Created automatically when one resource references another:
```hcl
resource "aws_instance" "web" {
  subnet_id = aws_subnet.main.id   # Implicit dependency on aws_subnet.main
}
```

### Explicit (`depends_on`)
When dependency isn't via attribute reference:
```hcl
resource "aws_instance" "web" {
  depends_on = [aws_security_group.web_sg]
}
```

---

## Meta-Arguments

### `count` — Multiple identical resources
```hcl
resource "aws_instance" "server" {
  count         = 3
  instance_type = "t3.micro"
  tags = { Name = "server-${count.index}" }   # 0, 1, 2
}
# Reference: aws_instance.server[0]
```

### `for_each` — Resources from map/set
```hcl
resource "aws_instance" "server" {
  for_each      = toset(["web", "api", "db"])
  instance_type = "t3.micro"
  tags = { Name = each.value }
}
# Reference: aws_instance.server["web"]
```

### count vs for_each

| | count | for_each |
|--|-------|----------|
| Identifier | Index (0, 1, 2) | Key from map/set |
| Remove middle item | Shifts all indexes | Only removes that key |
| Best for | Identical resources | Unique configs |
| Reference | `resource[0]` | `resource["key"]` |
| Input type | Number | Map or set (NOT list — use `toset()`) |

**Exam favorite:** `for_each` preferred — stable identity on removal.

**Exam wording trap:** `count` is **NOT deprecated**. Terraform fully supports it; `for_each` is often preferred for distinct resources.

---

## `lifecycle` Block

```hcl
lifecycle {
  create_before_destroy = true     # Create new before destroying old
  prevent_destroy       = true     # Block accidental deletion
  ignore_changes        = [tags]   # Ignore drift on specific attrs
  replace_triggered_by  = [aws_security_group.web.id]
}
```

---

## Provider Meta-Argument

```hcl
provider "aws" {
  alias  = "west"
  region = "us-west-2"
}

resource "aws_instance" "web" {
  provider = aws.west
}
```

---

## Input Variables

```hcl
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
  sensitive   = false
  nullable    = false

  validation {
    condition     = contains(["t3.micro", "t3.small"], var.instance_type)
    error_message = "Must be t3.micro or t3.small."
  }
}
```

### Variable Types
```
Primitive:  string, number, bool
Complex:    list(type), set(type), map(type)
Structural: object({key=type}), tuple([type, ...])
Special:    any
```

**Exam trap:** Use `number`, not `integer`. Use `list`, not `array`.

---

## Variable Precedence (Lowest → Highest)

1. Default value in variable block
2. `TF_VAR_<name>` environment variable
3. `terraform.tfvars` (auto-loaded)
4. `*.auto.tfvars` (auto-loaded, alphabetical)
5. `-var-file="file.tfvars"` flag
6. **`-var="key=value"` flag (HIGHEST)**

---

## Outputs

```hcl
output "instance_ip" {
  description = "Public IP"
  value       = aws_instance.web.public_ip
  sensitive   = true    # Hides in CLI output (still in state!)
}
```

---

## Locals

```hcl
locals {
  common_tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_instance" "web" {
  tags = local.common_tags
}
```

Reduce repetition. Not passed from outside like variables.

---

## Expressions

### Conditional
```hcl
instance_type = var.env == "prod" ? "t3.large" : "t3.micro"
```

### For Expression (List)
```hcl
upper_names = [for name in var.names : upper(name)]
```

### For Expression (Map)
```hcl
ip_map = { for k, v in var.servers : k => v.ip }
```

### Splat
```hcl
all_ips = aws_instance.web[*].public_ip
```

---

## Must-Know Functions

### String
`format`, `join`, `split`, `lower`, `upper`, `replace`, `trimspace`

### Numeric
`min`, `max`, `ceil`, `floor`

### Collection
`length`, `merge`, `concat`, `contains`, `keys`, `values`, `lookup`, `flatten`, `zipmap`, `toset`, `tolist`, `tomap`

### Type Conversion
`tostring`, `tonumber`, `tobool`

### Filesystem
`file`, `templatefile`, `fileexists`, `basename`, `dirname`, `path.module`

### Encoding
`base64encode`, `base64decode`, `jsonencode`, `jsondecode`

### Network
`cidrsubnet`, `cidrhost`

Practice in: `terraform console`

---

## Dynamic Blocks

```hcl
dynamic "ingress" {
  for_each = var.ingress_rules
  content {
    from_port   = ingress.value.port
    to_port     = ingress.value.port
    protocol    = "tcp"
    cidr_blocks = [ingress.value.cidr]
  }
}
```

For repeated **nested blocks** only (not top-level resources).

---

## Sensitive Data

- `sensitive = true` on variables/outputs hides CLI output
- **State still stores values in plaintext**
- Use Vault provider or HCP Terraform for secret management
- Never commit secrets to Git

---

## Exam Traps Summary

| Trap | Truth |
|------|-------|
| `for_each` accepts lists directly | **No** — use map/set or `toset()` |
| `sensitive` encrypts state | **No** — hides CLI output only |
| `-var` has lowest precedence | **No** — HIGHEST precedence |
| Data sources create resources | **No** — read only |
| `count.index` starts at 1 | **No** — starts at 0 |

---

## Self-Check Before Questions

- [ ] Can write resource and data source blocks?
- [ ] Know count vs for_each?
- [ ] Know all lifecycle options?
- [ ] Know variable precedence order?
- [ ] Know 15+ built-in functions?
- [ ] Can write conditional, for, and splat expressions?
- [ ] Can write dynamic blocks?

**Ready?** → [Take the 60-question quiz](../../questions/08-configuration/questions.md)
