# Terraform Associate 004  — 10-Day Exam Preparation Guide

> **Exam Code:** HashiCorp Certified: Terraform Associate (004)
> **Format:** Multiple choice, multi-select | **Questions:** ~57 | **Duration:** 60 minutes | **Passing:** ~70%

---

## Exam Domains & Weightage

| # | Domain | Weight |
|---|--------|--------|
| 1 | Understand Infrastructure as Code (IaC) | 5–7% |
| 2 | Understand the Purpose of Terraform (vs Other IaC) | 7–9% |
| 3 | Understand Terraform Basics | 10–12% |
| 4 | Use Terraform CLI (Outside of Core Workflow) | 8–10% |
| 5 | Interact with Terraform Modules | 8–10% |
| 6 | Use the Core Terraform Workflow | 8–10% |
| 7 | Implement and Maintain State | 12–15% |
| 8 | Read, Generate, and Modify Configuration | 15–18% |
| 9 | Understand HCP Terraform Capabilities | 8–10% |

---

## 10-Day Study Plan

### Day 1 — IaC Concepts & Why Terraform

**Topics:**
- What is Infrastructure as Code and why it matters
- Benefits: version control, automation, consistency, reusability
- Declarative vs Imperative approach (Terraform is declarative)
- Terraform vs other tools (Ansible, CloudFormation, Pulumi)
  - Terraform: infrastructure provisioning, cloud-agnostic, declarative HCL
  - Ansible: configuration management, procedural
  - CloudFormation: AWS-only, JSON/YAML
- Multi-cloud and provider-agnostic advantages

**Key Concepts:**
- Idempotency — running the same config multiple times produces the same result
- Immutable infrastructure — replace rather than modify
- Terraform is open source, written in Go, by HashiCorp

**Day 1 Checklist:**
- [ ] Can define Infrastructure as Code in my own words
- [ ] Can list at least 4 benefits of IaC
- [ ] Can explain the difference between declarative and imperative approaches
- [ ] Can compare Terraform with Ansible, CloudFormation, and Pulumi
- [ ] Understand what idempotency means in the context of IaC
- [ ] Understand what immutable infrastructure means
- [ ] Know that Terraform is cloud-agnostic and provider-based

---

### Day 2 — Terraform Basics & Installation

**Topics:**
- Installing Terraform (binary download, package managers)
- HCL (HashiCorp Configuration Language) syntax
- Terraform file structure (`.tf` files, `.tf.json`)
- Providers: what they are, how to configure them
- Provider versioning and version constraints
- The Terraform block (`terraform {}`)
- Required providers block

**Key Files:**
```
project/
├── main.tf            # Primary resource definitions
├── variables.tf       # Input variable declarations
├── outputs.tf         # Output value declarations
├── terraform.tfvars   # Variable value assignments
├── providers.tf       # Provider configurations
├── versions.tf        # Terraform and provider version constraints
├── .terraform/        # Downloaded providers and modules (auto-generated)
├── .terraform.lock.hcl # Dependency lock file (commit to VCS)
└── terraform.tfstate  # State file (do NOT commit)
```

**Commands:**
```bash
terraform version              # Check installed version
terraform -help                # List all commands
terraform <command> -help      # Help for a specific command
```

**Provider Configuration Example:**
```hcl
terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
```

**Version Constraints:**
| Operator | Meaning |
|----------|---------|
| `= 1.0`  | Exactly 1.0 |
| `>= 1.0` | 1.0 or newer |
| `~> 1.0` | >= 1.0, < 2.0 (pessimistic — most common) |
| `>= 1.0, < 2.0` | Between 1.0 and 2.0 |

**Day 2 Checklist:**
- [ ] Terraform is installed and `terraform version` works
- [ ] Can describe the purpose of each standard file (`main.tf`, `variables.tf`, `outputs.tf`, etc.)
- [ ] Know the difference between `.terraform/` and `.terraform.lock.hcl`
- [ ] Can write a provider block with version constraints from memory
- [ ] Understand all version constraint operators (`=`, `>=`, `~>`)
- [ ] Know that `~>` is the pessimistic constraint operator (most common in exams)
- [ ] Understand the `required_providers` block inside `terraform {}`
- [ ] Know which files to commit to VCS and which to ignore

---

### Day 3 — Core Workflow (Write → Plan → Apply)

**Topics:**
- The core workflow: Write → Init → Plan → Apply
- What each command does under the hood
- Execution plans and review
- Auto-approve and its dangers
- Destroying infrastructure
- Formatting and validation

**Commands:**
```bash
terraform init                 # Initialize working directory, download providers/modules
terraform init -upgrade        # Upgrade providers/modules to latest allowed versions
terraform init -migrate-state  # Reconfigure backend and migrate state

terraform validate             # Validate configuration syntax and internal consistency
terraform fmt                  # Format .tf files to canonical style
terraform fmt -check           # Check if files are formatted (CI-friendly, exit code 0/3)
terraform fmt -recursive       # Format files in subdirectories too

terraform plan                 # Preview changes without applying
terraform plan -out=plan.tfplan # Save plan to file for exact apply
terraform plan -destroy        # Preview what will be destroyed

terraform apply                # Apply changes (prompts for confirmation)
terraform apply plan.tfplan    # Apply a saved plan (no prompt)
terraform apply -auto-approve  # Skip confirmation prompt
terraform apply -target=aws_instance.web  # Apply only specific resource
terraform apply -var="name=value"         # Pass variable inline
terraform apply -var-file="prod.tfvars"   # Use specific variable file

terraform destroy              # Destroy all managed infrastructure
terraform destroy -auto-approve # Destroy without confirmation
terraform destroy -target=aws_instance.web # Destroy specific resource
```

**Plan Output Symbols:**
| Symbol | Meaning |
|--------|---------|
| `+`    | Resource will be created |
| `-`    | Resource will be destroyed |
| `~`    | Resource will be updated in-place |
| `-/+` | Resource will be destroyed and re-created (replacement) |
| `<=`   | Data source will be read |

**Day 3 Checklist:**
- [ ] Can explain what `terraform init` does (downloads providers, modules, sets up backend)
- [ ] Know the difference between `init`, `init -upgrade`, and `init -migrate-state`
- [ ] Can explain `terraform validate` vs `terraform fmt` (syntax check vs formatting)
- [ ] Know that `terraform plan` does NOT make changes — it only previews
- [ ] Can save a plan and apply it with `terraform plan -out` and `terraform apply plan.tfplan`
- [ ] Understand why `-auto-approve` is dangerous in production
- [ ] Can use `-target` to apply specific resources (and know it's for exceptional use only)
- [ ] Can pass variables via `-var` and `-var-file` flags
- [ ] Know all plan output symbols (+, -, ~, -/+, <=) by heart
- [ ] Understand the difference between `terraform destroy` and `terraform apply -destroy`

---

### Day 4 — Resources, Data Sources & Meta-Arguments

**Topics:**
- Resource blocks and their syntax
- Data sources — reading existing infrastructure
- Resource behavior: create, update, destroy, re-create
- Resource dependencies (implicit and explicit)
- Meta-arguments that change resource behavior

**Resource Syntax:**
```hcl
resource "<provider>_<type>" "<name>" {
  argument1 = "value1"
  argument2 = "value2"
}
```

**Data Source Syntax:**
```hcl
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-amd64-server-*"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id    # Reference data source
  instance_type = "t3.micro"
}
```

**Meta-Arguments:**
```hcl
# depends_on — Explicit dependency
resource "aws_instance" "web" {
  depends_on = [aws_security_group.web_sg]
  # ...
}

# count — Create multiple identical resources
resource "aws_instance" "server" {
  count         = 3
  ami           = "ami-123456"
  instance_type = "t3.micro"
  tags = {
    Name = "server-${count.index}"    # 0, 1, 2
  }
}

# for_each — Create resources from a map or set
resource "aws_instance" "server" {
  for_each      = toset(["web", "api", "db"])
  ami           = "ami-123456"
  instance_type = "t3.micro"
  tags = {
    Name = each.value                  # "web", "api", "db"
  }
}

# lifecycle — Control resource lifecycle
resource "aws_instance" "web" {
  # ...
  lifecycle {
    create_before_destroy = true       # New resource created before old is destroyed
    prevent_destroy       = true       # Prevent accidental deletion
    ignore_changes        = [tags]     # Ignore changes to specific attributes
    replace_triggered_by  = [aws_security_group.web_sg.id]
  }
}

# provider — Use a non-default provider configuration
provider "aws" {
  alias  = "west"
  region = "us-west-2"
}

resource "aws_instance" "web_west" {
  provider      = aws.west
  # ...
}
```

**count vs for_each:**
| Feature | count | for_each |
|---------|-------|----------|
| Identified by | Index (0, 1, 2...) | Key from map/set |
| Removing middle item | Shifts all subsequent indexes | Only removes that key |
| Best for | Identical resources | Resources with unique configs |
| Reference | `aws_instance.server[0]` | `aws_instance.server["web"]` |

**Day 4 Checklist:**
- [ ] Can write a resource block from memory with correct syntax
- [ ] Can write a data source block and reference its attributes
- [ ] Understand implicit dependencies (via attribute references) vs explicit (`depends_on`)
- [ ] Can use `count` with `count.index` to create multiple resources
- [ ] Can use `for_each` with a set or map and reference `each.key` / `each.value`
- [ ] Know why `for_each` is preferred over `count` (stable identity on removal)
- [ ] Can configure all `lifecycle` options: `create_before_destroy`, `prevent_destroy`, `ignore_changes`, `replace_triggered_by`
- [ ] Know how to use provider aliases for multi-region or multi-account setups
- [ ] Can explain the difference between resource address `[0]` (count) vs `["key"]` (for_each)

---

### Day 5 — Variables, Outputs & Expressions

**Topics:**
- Input variables (types, defaults, validation, sensitive)
- Output values
- Local values
- Variable precedence
- Expressions: conditionals, for, splat
- Built-in functions (know the common ones)
- Type constraints

**Input Variables:**
```hcl
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
  sensitive   = false
  nullable    = false

  validation {
    condition     = contains(["t3.micro", "t3.small", "t3.medium"], var.instance_type)
    error_message = "Instance type must be t3.micro, t3.small, or t3.medium."
  }
}
```

**Variable Types:**
```
Primitive:  string, number, bool
Complex:    list(type), set(type), map(type)
Structural: object({key=type, ...}), tuple([type, ...])
Special:    any
```

**Variable Precedence (lowest → highest):**
1. Default value in variable block
2. `TF_VAR_<name>` environment variable
3. `terraform.tfvars` file (auto-loaded)
4. `*.auto.tfvars` files (auto-loaded, alphabetical)
5. `-var-file="file.tfvars"` flag
6. `-var="key=value"` flag (HIGHEST priority)

**Outputs:**
```hcl
output "instance_ip" {
  description = "Public IP of the instance"
  value       = aws_instance.web.public_ip
  sensitive   = true      # Hides value in CLI output
}
```

**Locals:**
```hcl
locals {
  common_tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}

resource "aws_instance" "web" {
  tags = local.common_tags
}
```

**Expressions:**
```hcl
# Conditional
instance_type = var.environment == "prod" ? "t3.large" : "t3.micro"

# For expression (list)
upper_names = [for name in var.names : upper(name)]

# For expression (map)
instance_map = {for inst in aws_instance.web : inst.id => inst.private_ip}

# Splat expression
all_ips = aws_instance.web[*].public_ip
```

**Must-Know Functions:**
```hcl
# String
format("Hello, %s!", var.name)
join(", ", ["a", "b", "c"])          # "a, b, c"
split(",", "a,b,c")                  # ["a", "b", "c"]
lower("HELLO")                       # "hello"
upper("hello")                       # "HELLO"
replace("hello", "l", "L")           # "heLLo"
trimspace("  hello  ")               # "hello"

# Numeric
min(1, 2, 3)                         # 1
max(1, 2, 3)                         # 3
ceil(4.3)                            # 5
floor(4.7)                           # 4

# Collection
length(["a", "b"])                   # 2
merge({a=1}, {b=2})                  # {a=1, b=2}
concat(["a"], ["b"])                 # ["a", "b"]
contains(["a", "b"], "a")           # true
keys({a=1, b=2})                     # ["a", "b"]
values({a=1, b=2})                   # [1, 2]
lookup({a=1}, "a", "default")        # 1
flatten([[1,2],[3,4]])               # [1,2,3,4]
zipmap(["a","b"], [1,2])             # {a=1, b=2}
toset(["a", "b", "a"])              # toset(["a", "b"])
tolist(toset(["a","b"]))            # ["a", "b"]
tomap({a=1})                         # {a=1}

# Type Conversion
tostring(42)                         # "42"
tonumber("42")                       # 42
tobool("true")                       # true

# Filesystem
file("${path.module}/script.sh")     # Read file contents
templatefile("tpl.tftpl", {name="x"})# Render template
fileexists("file.txt")               # true/false
basename("/path/to/file.txt")        # "file.txt"
dirname("/path/to/file.txt")         # "/path/to"

# Encoding
base64encode("hello")
base64decode("aGVsbG8=")
jsonencode({a=1})
jsondecode("{\"a\":1}")

# IP/CIDR
cidrsubnet("10.0.0.0/16", 8, 1)     # "10.0.1.0/24"
```

**Commands:**
```bash
terraform console              # Interactive console to test expressions
terraform output               # Show all outputs
terraform output instance_ip   # Show specific output
terraform output -json         # Outputs in JSON format
```

**Day 5 Checklist:**
- [ ] Can declare a variable with `description`, `type`, `default`, `sensitive`, `nullable`, and `validation`
- [ ] Know all variable types: string, number, bool, list, set, map, object, tuple, any
- [ ] Can recite the variable precedence order (default → env → tfvars → auto.tfvars → -var-file → -var)
- [ ] Know that `-var` flag has the HIGHEST precedence
- [ ] Know that `terraform.tfvars` and `*.auto.tfvars` are auto-loaded
- [ ] Can write output blocks with `sensitive` flag
- [ ] Can use `locals` to reduce repetition
- [ ] Can write conditional expressions (`condition ? true_val : false_val`)
- [ ] Can write `for` expressions for both lists and maps
- [ ] Can use splat expressions (`[*]`)
- [ ] Know at least 15 built-in functions across string, numeric, collection, and filesystem categories
- [ ] Have practiced functions in `terraform console`
- [ ] Understand `templatefile()` and `file()` usage

---

### Day 6 — State Management (Critical Topic!)

**Topics:**
- What is Terraform state and why it exists
- State file structure (`terraform.tfstate`)
- Remote state backends (S3, Azure Blob, GCS, HCP Terraform)
- State locking and why it matters
- State commands
- Sensitive data in state (state always stores in plaintext!)
- Backend configuration

**Why State Exists:**
- Maps real-world resources to your configuration
- Tracks metadata and dependencies
- Caches resource attributes for performance
- Enables collaboration via remote state

**Backend Configuration:**
```hcl
terraform {
  backend "s3" {
    bucket         = "my-terraform-state"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"    # State locking
  }
}
```

**State Commands:**
```bash
terraform state list                          # List all resources in state
terraform state show aws_instance.web         # Show details of a resource
terraform state mv aws_instance.old aws_instance.new  # Rename/move resource in state
terraform state rm aws_instance.web           # Remove resource from state (does NOT destroy it)
terraform state pull                          # Download and output remote state
terraform state push                          # Upload local state to remote (dangerous!)
terraform state replace-provider hashicorp/aws registry.example.com/aws  # Replace provider

terraform show                                # Show current state in human-readable format
terraform show plan.tfplan                    # Show a saved plan
terraform show -json                          # Show state in JSON

terraform refresh                             # Reconcile state with real infrastructure (deprecated in favor of plan -refresh-only)
terraform plan -refresh-only                  # Preview what refresh would change
terraform apply -refresh-only                 # Apply refresh only
```

**Key State Concepts for Exam:**
- State file contains sensitive data in plaintext — always encrypt at rest
- Remote state enables team collaboration
- State locking prevents concurrent modifications
- `terraform state rm` removes from state only, does NOT destroy the actual resource
- `terraform state mv` is used for refactoring without destroying resources
- Backend changes require `terraform init -migrate-state`

**Day 6 Checklist:**
- [ ] Can explain why Terraform needs a state file (mapping, metadata, caching, collaboration)
- [ ] Know that state stores sensitive data in plaintext — must be encrypted
- [ ] Can configure an S3 backend with DynamoDB locking from memory
- [ ] Understand state locking and what happens if two people run `apply` simultaneously
- [ ] Know every `terraform state` subcommand: `list`, `show`, `mv`, `rm`, `pull`, `push`, `replace-provider`
- [ ] Understand that `state rm` removes from state only — does NOT destroy the real resource
- [ ] Understand that `state mv` lets you rename/refactor without destroy+recreate
- [ ] Know that `terraform refresh` is deprecated in favor of `terraform plan -refresh-only`
- [ ] Can use `terraform show` to inspect state or a saved plan
- [ ] Know that `terraform force-unlock` manually releases a stuck state lock
- [ ] Understand the difference between local and remote backends

---

### Day 7 — Modules

**Topics:**
- What are modules and why use them
- Root module vs child modules
- Module sources (local, Terraform Registry, GitHub, S3)
- Module inputs and outputs
- Module versioning
- Publishing modules to registry
- Module best practices

**Module Structure:**
```
modules/
└── vpc/
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    └── README.md
```

**Using a Local Module:**
```hcl
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr    = "10.0.0.0/16"
  environment = "prod"
}

# Access module outputs
resource "aws_instance" "web" {
  subnet_id = module.vpc.public_subnet_id
}
```

**Using a Registry Module:**
```hcl
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"                          # Always pin versions!

  name = "my-vpc"
  cidr = "10.0.0.0/16"
}
```

**Module Sources:**
```hcl
source = "./modules/vpc"                              # Local path
source = "terraform-aws-modules/vpc/aws"              # Terraform Registry
source = "github.com/org/repo//modules/vpc"           # GitHub
source = "git::https://example.com/repo.git"          # Generic Git
source = "s3::https://s3.amazonaws.com/bucket/vpc.zip"# S3
```

**Key Module Concepts for Exam:**
- Root module = the directory where you run `terraform` commands
- Modules do NOT inherit provider configurations — pass them explicitly or use `configuration_aliases`
- `terraform init` downloads modules
- `terraform get` downloads/updates modules without initializing providers
- Variables inside a module are NOT automatically accessible — must be declared as outputs
- Registry modules follow naming: `terraform-<PROVIDER>-<NAME>`

**Day 7 Checklist:**
- [ ] Can explain what a module is and why modules are useful (reusability, organization, encapsulation)
- [ ] Know the difference between root module and child modules
- [ ] Can write a module block with `source` and pass input variables
- [ ] Can access module outputs using `module.<name>.<output>`
- [ ] Know all module sources: local path, Terraform Registry, GitHub, Git, S3
- [ ] Know that registry modules use `source = "namespace/name/provider"` format
- [ ] Know that `version` is supported for registry modules (always pin!)
- [ ] Understand that `terraform init` downloads modules, `terraform get` updates them
- [ ] Know that child modules do NOT inherit provider config from the root module
- [ ] Know that variables inside a module must be exposed via `output` blocks to be accessible
- [ ] Understand the registry naming convention: `terraform-<PROVIDER>-<NAME>`

---

### Day 8 — Import, Moved, Workspaces & CLI Extras

**Topics:**
- Importing existing infrastructure
- `moved` blocks for refactoring
- Terraform workspaces
- Debugging and logging
- Provisioners (and why to avoid them)
- Dynamic blocks
- Terraform CLI configuration file

**Import (bringing existing resources under Terraform management):**
```bash
# CLI import (traditional)
terraform import aws_instance.web i-1234567890abcdef0

# Plan-based import (Terraform 1.5+, preferred in 004 exam)
```

```hcl
import {
  to = aws_instance.web
  id = "i-1234567890abcdef0"
}

# Then run:
# terraform plan -generate-config-out=generated.tf
```

**Moved Blocks (refactoring without destroy/recreate):**
```hcl
moved {
  from = aws_instance.old_name
  to   = aws_instance.new_name
}

moved {
  from = aws_instance.web
  to   = module.compute.aws_instance.web
}
```

**Workspaces:**
```bash
terraform workspace list              # List workspaces (* = current)
terraform workspace new dev           # Create new workspace
terraform workspace select dev        # Switch to workspace
terraform workspace show              # Show current workspace
terraform workspace delete dev        # Delete workspace

# In configuration:
# terraform.workspace returns current workspace name
```

```hcl
resource "aws_instance" "web" {
  instance_type = terraform.workspace == "prod" ? "t3.large" : "t3.micro"
  tags = {
    Environment = terraform.workspace
  }
}
```

**Debugging:**
```bash
export TF_LOG=TRACE          # Enable logging (TRACE, DEBUG, INFO, WARN, ERROR)
export TF_LOG_PATH=debug.log # Write logs to file
export TF_LOG=""             # Disable logging
```

**Provisioners (know them but avoid them):**
```hcl
resource "aws_instance" "web" {
  # ...

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> ips.txt"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx",
    ]
  }

  provisioner "file" {
    source      = "conf/app.conf"
    destination = "/etc/app.conf"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip
  }
}
```

**Why Avoid Provisioners:**
- Not tracked in state
- Can fail silently
- Break the declarative model
- Use cloud-init, Packer, or Ansible instead

**Dynamic Blocks:**
```hcl
variable "ingress_rules" {
  default = [
    { port = 80,  cidr = "0.0.0.0/0" },
    { port = 443, cidr = "0.0.0.0/0" },
  ]
}

resource "aws_security_group" "web" {
  name = "web-sg"

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = [ingress.value.cidr]
    }
  }
}
```

**Day 8 Checklist:**
- [ ] Can import a resource using CLI: `terraform import <addr> <id>`
- [ ] Know the config-based import block syntax (`import { to = ..., id = ... }`)
- [ ] Know that `terraform plan -generate-config-out` generates config for import blocks
- [ ] Can write `moved` blocks to rename or relocate resources without destroying them
- [ ] Know all workspace commands: `list`, `new`, `select`, `show`, `delete`
- [ ] Can use `terraform.workspace` in configuration for environment-specific logic
- [ ] Understand that CLI workspaces share config but have separate state files
- [ ] Know all TF_LOG levels: TRACE, DEBUG, INFO, WARN, ERROR
- [ ] Can set `TF_LOG` and `TF_LOG_PATH` environment variables for debugging
- [ ] Know all three provisioner types: `local-exec`, `remote-exec`, `file`
- [ ] Can explain why provisioners are discouraged (not in state, break declarative model)
- [ ] Can write a `dynamic` block with `for_each` and `content`
- [ ] Know that `self` refers to the parent resource inside a provisioner

---

### Day 9 — HCP Terraform (Terraform Cloud) & Collaboration

**Topics:**
- What is HCP Terraform (formerly Terraform Cloud)
- Workspaces in HCP Terraform vs CLI workspaces
- Remote execution (runs happen in HCP Terraform, not locally)
- VCS-driven workflow vs CLI-driven vs API-driven
- State management in HCP Terraform
- Sentinel (policy as code — HashiCorp's policy framework)
- Cost estimation
- Private module registry
- Teams and governance
- Run triggers
- Secure variable storage

**HCP Terraform Backend Configuration:**
```hcl
terraform {
  cloud {
    organization = "my-org"
    workspaces {
      name = "my-workspace"
    }
  }
}
```

**CLI-Driven Workflow:**
```bash
terraform login                # Authenticate with HCP Terraform
terraform init                 # Initialize with cloud backend
terraform plan                 # Plan runs remotely
terraform apply                # Apply runs remotely
```

**Key HCP Terraform Concepts for Exam:**
- **Free tier** includes up to 500 managed resources
- **Workspaces** in HCP Terraform ≠ CLI workspaces (HCP = separate state + config + variables)
- **Execution modes:** Remote (default), Local, Agent
- **Sentinel** policies run between plan and apply (advisory or hard-mandatory)
- **Run triggers** let one workspace trigger another
- **State is stored and encrypted** in HCP Terraform automatically
- **Variables** can be stored as Terraform variables or environment variables (with sensitive flag)
- **Private registry** can host modules and providers for the organization
- **Cost estimation** is available for AWS, Azure, and GCP resources

**Day 9 Checklist:**
- [ ] Can explain what HCP Terraform is and how it differs from open-source Terraform
- [ ] Know the `cloud {}` block configuration syntax
- [ ] Understand the three workflow types: VCS-driven, CLI-driven, API-driven
- [ ] Know HCP Terraform workspaces are NOT the same as CLI workspaces
- [ ] Know the three execution modes: Remote, Local, Agent
- [ ] Can explain Sentinel and when policies are evaluated (between plan and apply)
- [ ] Know the difference between advisory and hard-mandatory Sentinel policies
- [ ] Understand run triggers (one workspace triggers another)
- [ ] Know that HCP Terraform stores state encrypted automatically
- [ ] Know how to store variables (Terraform vars vs environment vars, sensitive flag)
- [ ] Understand the private module registry for organizations
- [ ] Know that cost estimation works for AWS, Azure, and GCP
- [ ] Can authenticate using `terraform login`

---

### Day 10 — Review, Practice & Exam Strategy

**Full Command Reference:**
```bash
# CORE WORKFLOW
terraform init                 # Initialize
terraform validate             # Validate syntax
terraform plan                 # Preview changes
terraform apply                # Apply changes
terraform destroy              # Destroy infrastructure

# STATE
terraform state list           # List resources
terraform state show <addr>    # Show resource details
terraform state mv             # Move/rename resource
terraform state rm             # Remove from state
terraform state pull           # Download remote state
terraform state push           # Upload state (danger!)

# INSPECTION
terraform show                 # Human-readable state/plan
terraform output               # View outputs
terraform console              # Interactive expression testing
terraform graph                # Generate dependency graph (DOT format)
terraform providers            # List providers required
terraform providers mirror     # Mirror providers locally

# WORKSPACE
terraform workspace list
terraform workspace new <name>
terraform workspace select <name>
terraform workspace show
terraform workspace delete <name>

# UTILITY
terraform fmt                  # Format code
terraform taint <addr>         # Mark resource for recreation (deprecated → use -replace)
terraform untaint <addr>       # Remove taint mark (deprecated)
terraform plan -replace=<addr> # Plan with forced replacement (preferred)
terraform apply -replace=<addr>
terraform force-unlock <id>    # Manually release state lock
terraform login                # Auth to HCP Terraform
terraform logout               # Remove stored credentials
terraform test                 # Run module tests (.tftest.hcl files)

# IMPORT
terraform import <addr> <id>   # Import existing resource
terraform plan -generate-config-out=generated.tf  # Generate config for import blocks
```

**Quick-Fire Exam Tips:**

1. **Terraform does NOT manage resources it didn't create** unless you `import` them
2. **State file always contains sensitive data in plaintext** — encrypt and restrict access
3. **`terraform fmt`** only changes style, never logic
4. **`terraform validate`** checks syntax, NOT cloud API connectivity
5. **`terraform plan -refresh-only`** replaces the deprecated `terraform refresh`
6. **`-replace`** flag replaces the deprecated `terraform taint`
7. **Provisioners are a last resort** — the exam wants you to know they exist but avoid them
8. **`count.index`** starts at 0
9. **`for_each`** works with maps and sets, NOT lists (convert with `toset()`)
10. **Modules from registry** use `source = "namespace/name/provider"` format
11. **`.terraform.lock.hcl`** should be committed to version control
12. **`terraform.tfstate`** should NEVER be committed to version control
13. **Backend config changes** require `terraform init -migrate-state`
14. **`terraform.workspace`** returns the current workspace name
15. **HCP Terraform workspaces** are different from CLI workspaces
16. **Sentinel** is available in HCP Terraform Team & Governance tier
17. **`depends_on`** is for explicit dependencies; implicit dependencies come from references
18. **`terraform apply -target`** should only be used in exceptional circumstances
19. **Data sources** read information, they don't create resources
20. **`moved` blocks** allow refactoring without destroying resources

**Day 10 Checklist:**
- [ ] Reviewed all commands in the full command reference above
- [ ] Can recall each command's purpose without looking
- [ ] Re-read all 20 quick-fire exam tips
- [ ] Completed all checklists from Day 1–9 (go back and tick off any remaining)
- [ ] Taken at least 2 full-length practice exams
- [ ] Scored 80%+ on practice exams consistently
- [ ] Reviewed wrong answers and understood why
- [ ] Feel confident about state management questions (highest-weight domain)
- [ ] Feel confident about variables, expressions, and functions
- [ ] Have a calm exam-day plan (time management: ~1 min per question, flag and revisit)

---

## Master Practice Checklist

- [ ] Can explain IaC benefits and Terraform's role
- [ ] Understand provider configuration and version constraints
- [ ] Know the full core workflow and what each command does
- [ ] Comfortable with all resource meta-arguments (count, for_each, depends_on, lifecycle, provider)
- [ ] Can write and use variables, outputs, and locals
- [ ] Know variable precedence order by heart
- [ ] Understand state purpose, remote backends, and state locking
- [ ] Can use all `terraform state` subcommands correctly
- [ ] Know how to write and use modules (local + registry)
- [ ] Understand import (both CLI and config-based)
- [ ] Know workspace commands and their use cases
- [ ] Understand dynamic blocks and when to use them
- [ ] Know provisioner types and why they're discouraged
- [ ] Comfortable with common built-in functions
- [ ] Understand HCP Terraform features (Sentinel, remote execution, VCS workflow)
- [ ] Know the difference between HCP Terraform workspaces and CLI workspaces
- [ ] Can read and interpret plan output symbols (+, -, ~, -/+)
- [ ] Understand `.terraform.lock.hcl` purpose and behavior

## Recommended Resources

- [HashiCorp Terraform Associate 004 Study Guide](https://developer.hashicorp.com/terraform/tutorials/certification-004/associate-study-004)
- [HashiCorp Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
- [Terraform Registry](https://registry.terraform.io/)
- [HashiCorp Learn — Terraform Tutorials](https://developer.hashicorp.com/terraform/tutorials)
- [Exam Review Questions (Official)](https://developer.hashicorp.com/terraform/tutorials/certification-004/associate-review-004)

---

> **Pro tip:** Spend 60% of your time on Days 5–8 (variables, state, modules, import). These domains carry the most weight and trip up most candidates. Use `terraform console` heavily to experiment with functions and expressions.
