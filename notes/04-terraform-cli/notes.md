# Domain 4: Use Terraform CLI (Outside of Core Workflow)

> **Exam Weight:** 8–10% | **Practice:** [60 Questions](../../questions/04-terraform-cli/questions.md) | **Example:** [fmt-validate-console](../../examples/04-terraform-cli/fmt-validate-console/)

---

## Import — Bring Existing Resources Under Terraform

Terraform does NOT manage resources it didn't create. Use **import** to adopt existing infrastructure.

### CLI Import (Traditional)
```bash
terraform import aws_instance.web i-1234567890abcdef0
#              <resource_address>  <cloud_resource_id>
```

### Config-Based Import (Terraform 1.5+, preferred on 004 exam)
```hcl
import {
  to = aws_instance.web
  id = "i-1234567890abcdef0"
}
```

Then generate config:
```bash
terraform plan -generate-config-out=generated.tf
```

**After import:** Configuration must match the real resource or the next plan will try to change/destroy it.

---

## `moved` Blocks — Refactor Without Destroy

Rename or relocate resources in state without destroy+recreate:

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

**Exam trap:** `moved` updates state mapping. `state mv` is the CLI equivalent.

---

## CLI Workspaces

Workspaces = multiple **state files** for the **same configuration**.

```bash
terraform workspace list       # * = current
terraform workspace new dev
terraform workspace select dev
terraform workspace show
terraform workspace delete dev
```

In configuration:
```hcl
resource "aws_instance" "web" {
  instance_type = terraform.workspace == "prod" ? "t3.large" : "t3.micro"
  tags = {
    Environment = terraform.workspace
  }
}
```

| CLI Workspaces | HCP Terraform Workspaces |
|----------------|--------------------------|
| Same config, different state files | Separate state + config + variables |
| Local or remote backend | Managed in HCP Terraform |
| Good for env separation (dev/staging) | Full team collaboration platform |

**Exam trap:** CLI workspaces ≠ HCP Terraform workspaces.

---

## Debugging & Logging

```bash
export TF_LOG=TRACE          # TRACE, DEBUG, INFO, WARN, ERROR
export TF_LOG_PATH=debug.log # Write to file
export TF_LOG=""             # Disable
```

Use **TRACE** for maximum verbosity when troubleshooting.

---

## Other CLI Commands

```bash
terraform console            # Interactive expression testing
terraform graph              # Dependency graph (DOT format)
terraform output             # View outputs
terraform output -json       # JSON format
terraform providers          # List required providers
terraform providers mirror   # Mirror providers locally
terraform force-unlock <ID>  # Release stuck state lock
terraform login              # Auth to HCP Terraform
terraform logout             # Remove credentials
terraform test               # Run .tftest.hcl module tests
```

---

## Taint / Replace (Deprecated → Modern)

| Old (Deprecated) | New (Preferred) |
|------------------|-----------------|
| `terraform taint <addr>` | `terraform plan -replace=<addr>` |
| `terraform untaint <addr>` | Remove from plan |

`-replace` forces resource destruction and recreation on next apply.

---

## Provisioners (Know Them, Avoid Them)

Three types:
- `local-exec` — run command on machine running Terraform
- `remote-exec` — run command on created resource (needs `connection`)
- `file` — copy files to resource (needs `connection`)

| | local-exec | remote-exec |
|--|------------|-------------|
| Where it runs | Laptop / CI runner | Inside the remote VM |
| SSH needed? | No | Yes (or WinRM) |
| Typical use | Notifications, local scripts | Bootstrap after create |

```hcl
provisioner "local-exec" {
  command = "echo ${self.private_ip} >> ips.txt"
}
```

**Why avoid:**
- Not fully tracked in state
- Can fail silently
- Break declarative model
- Use **cloud-init, Packer, or Ansible** instead

`self` = reference to the parent resource inside a provisioner.

---

## Dynamic Blocks

Generate repeated nested blocks from a variable:

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

Only works for **nested blocks**, not top-level resources.

---

## Self-Check Before Questions

- [ ] Know CLI import vs config-based import?
- [ ] Can write `moved` blocks?
- [ ] Know all workspace commands?
- [ ] Know TF_LOG levels?
- [ ] Know `-replace` replaces `taint`?
- [ ] Know why provisioners are discouraged?
- [ ] Can write a `dynamic` block?

**Ready?** → [Take the 60-question quiz](../../questions/04-terraform-cli/questions.md)
