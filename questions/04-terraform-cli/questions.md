# Use Terraform CLI (Outside of Core Workflow)

> **Exam Domain:** Use Terraform CLI (Outside of Core Workflow) | **Weight:** 8-10%
> **Questions:** 60 | **Format:** Multiple choice & multi-select (like Terraform Associate 004)

Covers workspaces, import, moved blocks, logging, graph, console, taint/replace, force-unlock, provisioners, and dynamic blocks.

**Instructions:** Answer each question, then expand the dropdown to check your answer and explanation.

---

### Question 1

What does the `terraform workspace` command manage?

- A. Remote backend credentials for HCP Terraform
- B. Multiple isolated state files within the same configuration directory
- C. Separate copies of all .tf configuration files per environment
- D. Provider plugin versions for each deployment stage

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** CLI workspaces isolate state (terraform.tfstate.d/<name>/) while sharing the same configuration. They are not separate config trees or HCP workspace objects.

</details>

---
### Question 2

Which command creates a new Terraform CLI workspace named `staging`?

- A. terraform workspace create staging
- B. terraform workspace new staging
- C. terraform workspace add staging
- D. terraform workspace init staging

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** The subcommand is `new`, not `create` or `add`. `terraform workspace new staging` creates and switches to the new workspace.

</details>

---
### Question 3

How do you switch the active CLI workspace to `prod`?

- A. terraform workspace use prod
- B. terraform workspace switch prod
- C. terraform workspace select prod
- D. terraform workspace set prod

<details>
<summary>View Answer</summary>

**Correct Answer: C**

**Explanation:** `terraform workspace select <name>` changes the active workspace. There is no `use`, `switch`, or `set` subcommand.

</details>

---
### Question 4

What does `terraform workspace show` output?

- A. A list of all workspaces with an asterisk on the current one
- B. The name of the currently selected workspace
- C. Detailed state contents for the current workspace
- D. Workspace-specific variable overrides from terraform.tfvars

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `show` prints only the current workspace name. Use `terraform workspace list` to see all workspaces.

</details>

---
### Question 5

In an HCL configuration, what does `terraform.workspace` return?

- A. The filesystem path to the active workspace state file
- B. The name of the currently selected CLI workspace
- C. The HCP Terraform workspace slug configured in the backend
- D. The default workspace name from terraform.tfvars

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `terraform.workspace` is a built-in expression that returns the current CLI workspace name (e.g., `default`, `dev`, `prod`).

</details>

---
### Question 6

What happens when you delete the currently active workspace with `terraform workspace delete`?

- A. Terraform automatically selects `default` and deletes the workspace
- B. The command fails; you must switch away before deleting
- C. All resources in that workspace are destroyed automatically
- D. The workspace is archived but state is preserved

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** You cannot delete the workspace you are currently using. Select another workspace first, then delete.

</details>

---
### Question 7

Where is state stored for a non-default CLI workspace named `dev`?

- A. In a separate `dev/` subdirectory containing its own .tf files
- B. In `terraform.tfstate.d/dev/terraform.tfstate`
- C. In the remote backend under a workspace key matching `dev`
- D. In `.terraform/workspaces/dev/terraform.tfstate` only for local backends

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** CLI workspaces store state under `terraform.tfstate.d/<workspace>/`. Default workspace uses `terraform.tfstate` in the root.

</details>

---
### Question 8

Which of the following are valid `terraform workspace` subcommands? Select all that apply.

- A. list
- B. new
- C. rename
- D. delete

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, D**

**Explanation:** Valid subcommands are `list`, `new`, `select`, `show`, and `delete`. There is no `rename` or `create` subcommand.

</details>

---
### Question 9

What is the default CLI workspace name when none has been created?

- A. main
- B. default
- C. production
- D. root

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Every configuration starts in the `default` workspace until you create and select others.

</details>

---
### Question 10

Can two CLI workspaces in the same directory use different provider versions simultaneously?

- A. Yes, each workspace maintains its own provider lock file
- B. No, provider versions are defined in shared configuration and lock file for the directory
- C. Yes, but only when using a remote backend
- D. Only if each workspace has its own backend block

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Workspaces isolate state, not configuration. All workspaces share the same .tf files and `.terraform.lock.hcl`.

</details>

---
### Question 11

What is the traditional CLI syntax to import an existing AWS instance into state?

- A. terraform import -id=i-abc123 aws_instance.web
- B. terraform import aws_instance.web i-abc123
- C. terraform state import aws_instance.web i-abc123
- D. terraform plan -import aws_instance.web i-abc123

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `terraform import <resource_address> <resource_id>` adds an existing resource to state. The address comes first, then the cloud provider ID.

</details>

---
### Question 12

What does an `import` block in configuration declare?

- A. That Terraform should export state to a file after apply
- B. The target resource address and cloud ID for plan-based import
- C. A module source URL for importing registry modules
- D. That a resource must be destroyed before recreation

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Import blocks (`import { to = ..., id = ... }`) declare intent; Terraform imports during plan/apply when using the modern workflow.

</details>

---
### Question 13

Which flag generates configuration for resources declared in `import` blocks?

- A. terraform apply -generate-config
- B. terraform plan -generate-config-out=generated.tf
- C. terraform import -config-out=generated.tf
- D. terraform console -generate-config

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `terraform plan -generate-config-out=<file>` produces suggested resource blocks for import targets, reducing manual HCL writing.

</details>

---
### Question 14

Does `terraform import` (CLI) modify your .tf configuration files?

- A. Yes, it writes a matching resource block automatically
- B. No, it only updates state; you must write configuration separately
- C. Yes, but only when using -generate-config-out
- D. It modifies variables.tf with the imported ID

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** CLI import updates state only. You still need matching configuration. Plan-based import with `-generate-config-out` can help generate config.

</details>

---
### Question 15

After adding an `import` block, which command applies the import as part of the normal workflow?

- A. terraform import apply
- B. terraform apply (after plan shows the import action)
- C. terraform init -import
- D. terraform validate -import

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** With import blocks, `terraform plan` previews the import and `terraform apply` executes it—no separate import command is required.

</details>

---
### Question 16

Which statements about Terraform import are correct? Select all that apply.

- A. Import brings existing infrastructure under Terraform management
- B. CLI import requires you to write matching resource configuration
- C. Import blocks are evaluated during plan and apply
- D. Import automatically destroys and recreates the resource

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, C**

**Explanation:** Import associates existing resources with state without recreating them. Configuration must match the real resource. Import blocks integrate with plan/apply; they do not destroy resources.

</details>

---
### Question 17

What is the primary purpose of a `moved` block?

- A. Migrate state between remote backends
- B. Record resource address changes without destroy-and-recreate
- C. Move .tf files into a module directory on disk
- D. Transfer ownership of a resource to another AWS account

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `moved { from = ... to = ... }` tells Terraform the resource was renamed or relocated in configuration, updating state mapping in place.

</details>

---
### Question 18

When refactoring `aws_instance.web` into `module.compute.aws_instance.web`, which block avoids replacement?

- A. import { to = module.compute.aws_instance.web id = ... }
- B. moved { from = aws_instance.web to = module.compute.aws_instance.web }
- C. terraform state replace aws_instance.web module.compute.aws_instance.web
- D. lifecycle { prevent_destroy = true }

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** A `moved` block updates state tracking when addresses change. `terraform state mv` is the CLI equivalent.

</details>

---
### Question 19

Do `moved` blocks change real infrastructure in the cloud?

- A. Yes, they trigger an in-place API update
- B. No, they only update how Terraform maps configuration addresses to state
- C. Yes, they recreate resources with new names
- D. Only when combined with terraform taint

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `moved` blocks are a state/configuration refactoring mechanism. They do not call cloud APIs to modify resources.

</details>

---
### Question 20

Which environment variable enables Terraform debug logging?

- A. TF_DEBUG
- B. TF_LOG
- C. TF_TRACE
- D. TERRAFORM_LOG_LEVEL

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Set `TF_LOG` to TRACE, DEBUG, INFO, WARN, or ERROR. `TF_DEBUG` is not a standard Terraform variable.

</details>

---
### Question 21

What is the most verbose valid `TF_LOG` level?

- A. DEBUG
- B. VERBOSE
- C. TRACE
- D. DETAIL

<details>
<summary>View Answer</summary>

**Correct Answer: C**

**Explanation:** Valid levels from most to least verbose: TRACE, DEBUG, INFO, WARN, ERROR. TRACE provides the most detail.

</details>

---
### Question 22

Which are valid values for the `TF_LOG` environment variable? Select all that apply.

- A. TRACE
- B. DEBUG
- C. VERBOSE
- D. ERROR

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, D**

**Explanation:** Valid TF_LOG levels are TRACE, DEBUG, INFO, WARN, and ERROR. VERBOSE is not a recognized level.

</details>

---
### Question 23

What does setting `TF_LOG_PATH=./debug.log` accomplish?

- A. Redirects provider API calls to a proxy log
- B. Writes Terraform log output to the specified file
- C. Stores the execution plan in a log file
- D. Enables state locking diagnostics only

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `TF_LOG_PATH` directs log output to a file. You must also set `TF_LOG` to a level for logging to occur.

</details>

---
### Question 24

How do you disable Terraform logging after it was enabled?

- A. unset TF_LOG_PATH only
- B. Set TF_LOG to an empty string or unset TF_LOG
- C. Run terraform init -no-log
- D. Delete the .terraform directory

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Setting `TF_LOG=""` or unsetting `TF_LOG` disables logging. TF_LOG_PATH alone does not enable logging without TF_LOG.

</details>

---
### Question 25

What format does `terraform graph` produce by default?

- A. JSON dependency tree
- B. DOT graph description language
- C. YAML resource inventory
- D. Plain-text indented hierarchy

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `terraform graph` outputs a DOT-format dependency graph suitable for Graphviz (`dot`) rendering.

</details>

---
### Question 26

What does `terraform console` allow you to evaluate?

- A. Shell commands on the provisioned server
- B. HCL expressions against the current state and configuration
- C. Provider API credentials interactively
- D. Remote backend migration scripts

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `terraform console` is an interactive REPL for testing expressions, functions, and references like `var.name` or `aws_instance.web.id`.

</details>

---
### Question 27

Must you run `terraform apply` before using `terraform console` to reference managed resources?

- A. Yes, console only works after apply
- B. No, but resources must exist in state (typically after at least one apply)
- C. No, console simulates without any state
- D. Yes, and you must refresh state first every time

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Console reads current state and configuration. Resources need to be in state to return real attribute values.

</details>

---
### Question 28

What is the modern replacement for `terraform taint`?

- A. terraform untaint
- B. terraform apply -replace=<address>
- C. terraform destroy -target
- D. terraform state rm

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `terraform taint` is deprecated. Use `terraform apply -replace=<resource_address>` or `-replace` in plan to force replacement.

</details>

---
### Question 29

What did `terraform taint` mark a resource for?

- A. Permanent deletion from state without cloud changes
- B. Forced destroy-and-recreate on the next apply
- C. Read-only mode during plan
- D. Exclusion from all future plans

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Tainting flagged a resource for replacement on the next apply. `-replace` achieves the same declaratively.

</details>

---
### Question 30

What does `terraform untaint` do on a tainted resource?

- A. Deletes the resource from the cloud
- B. Removes the taint flag so it is not force-replaced
- C. Moves the resource to a new address
- D. Unlocks a stuck state lock

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `terraform untaint <address>` cleared the taint. Both taint and untaint are deprecated in favor of `-replace`.

</details>

---
### Question 31

Which statements about taint and replace are true? Select all that apply.

- A. `terraform taint` is deprecated
- B. `-replace` can be passed to `terraform apply`
- C. `terraform untaint` forces immediate recreation
- D. Tainting marked a resource for replacement on next apply

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, D**

**Explanation:** Taint/untaint are deprecated. `-replace` on apply (or plan) forces replacement. Untaint removed the taint—it did not recreate resources.

</details>

---
### Question 32

When should you use `terraform force-unlock`?

- A. When provider credentials have expired
- B. When a stale state lock ID blocks operations after a crashed process
- C. To unlock encrypted variable files
- D. To bypass workspace permission checks

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `terraform force-unlock <LOCK_ID>` manually releases a state lock left by an interrupted operation. Use only when sure no other process holds the lock.

</details>

---
### Question 33

What argument does `terraform force-unlock` require?

- A. The backend bucket name
- B. The lock ID shown in the error message
- C. The workspace name to unlock
- D. The provider alias to reset

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** The command requires the lock ID from the locking error (e.g., DynamoDB lock UUID). Wrongful unlock can corrupt concurrent runs.

</details>

---
### Question 34

Which provisioner runs a command on the machine where Terraform is executed?

- A. remote-exec
- B. local-exec
- C. file
- D. connection

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `local-exec` runs on the Terraform host. `remote-exec` and `file` run on the resource via a `connection` block.

</details>

---
### Question 35

Inside a provisioner block, what does `self` refer to?

- A. The root module's provider configuration
- B. The resource the provisioner is attached to
- C. The Terraform CLI process ID
- D. The remote state backend object

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `self` references the parent resource's attributes (e.g., `self.public_ip`) within provisioner and connection blocks.

</details>

---
### Question 36

Which provisioner copies files to a remote resource?

- A. local-exec
- B. remote-exec
- C. file
- D. null_resource

<details>
<summary>View Answer</summary>

**Correct Answer: C**

**Explanation:** The `file` provisioner uploads files to the remote host defined in the `connection` block.

</details>

---
### Question 37

Why does HashiCorp discourage provisioners?

- A. They are not supported in Terraform 1.0+
- B. They are not fully tracked in state and break the declarative model
- C. They only work with the local backend
- D. They require HCP Terraform Enterprise

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Provisioners run imperative scripts, can fail independently of resource lifecycle, and are a last resort. Prefer cloud-init, user_data, or configuration management.

</details>

---
### Question 38

Which are valid Terraform provisioner types? Select all that apply.

- A. local-exec
- B. remote-exec
- C. shell-exec
- D. file

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, D**

**Explanation:** The three built-in provisioner types are `local-exec`, `remote-exec`, and `file`. There is no `shell-exec` provisioner.

</details>

---
### Question 39

What must be defined for `remote-exec` and `file` provisioners to connect?

- A. A `backend` block
- B. A `connection` block
- C. An `import` block
- D. A `moved` block

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Remote provisioners require a `connection` block (SSH, WinRM, etc.) specifying host, user, and credentials—often using `self` for the host.

</details>

---
### Question 40

When do provisioners run relative to resource creation?

- A. Before the resource is planned
- B. After the resource is created (on create by default)
- C. Only during terraform destroy
- D. During terraform validate

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Provisioners run on lifecycle events (default: after create). They can also be configured for destroy with `when = destroy`.

</details>

---
### Question 41

What is the purpose of a `dynamic` block in Terraform?

- A. Generate provider configuration at runtime
- B. Repeatedly generate nested blocks from a complex variable or collection
- C. Dynamically download modules from the registry
- D. Switch backends based on workspace name

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Dynamic blocks iterate over a collection to produce repeated nested blocks (e.g., multiple `ingress` rules in a security group).

</details>

---
### Question 42

Which meta-argument is required inside a `dynamic` block?

- A. for_each
- B. iterator (optional but `for_each` is required on the dynamic block)
- C. count only
- D. source

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** A `dynamic` block requires `for_each` and a `content` block. An optional `iterator` renames the loop variable.

</details>

---
### Question 43

In a dynamic block, where do you define the repeated nested block body?

- A. Inside a `repeat` block
- B. Inside the `content` block
- C. Inside the `dynamic` label directly
- D. Inside a separate .tfvars file

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** The `content` block holds the nested block template, using the iterator (default `dynamic`) to reference each element.

</details>

---
### Question 44

Which statements about dynamic blocks are correct? Select all that apply.

- A. They reduce duplication for repeated nested blocks
- B. They require a `content` block
- C. They can replace the need for any resource block
- D. They use `for_each` to iterate a collection

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, D**

**Explanation:** Dynamic blocks generate nested blocks from collections. They do not replace top-level resource blocks entirely.

</details>

---
### Question 45

Can you use `terraform workspace select` to switch HCP Terraform remote workspaces?

- A. Yes, it configures the cloud backend workspace
- B. No, CLI workspaces are local state isolation; HCP workspaces are configured in the backend block
- C. Yes, but only after terraform login
- D. Only when TF_WORKSPACE is set

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** A common exam trap: CLI `terraform workspace` commands manage local workspace state files, not HCP Terraform workspace selection (done via backend config).

</details>

---
### Question 46

What does an asterisk (*) indicate in `terraform workspace list` output?

- A. The workspace that failed last apply
- B. The currently selected workspace
- C. The workspace with the largest state file
- D. The default workspace only

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** The asterisk marks the active workspace in the list output.

</details>

---
### Question 47

Can you delete the `default` workspace?

- A. Yes, with terraform workspace delete default
- B. No, the default workspace cannot be deleted
- C. Yes, but only when another workspace exists
- D. Only with -force flag

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** The `default` workspace always exists and cannot be removed. You can delete other workspaces after switching away.

</details>

---
### Question 48

Does plan-based import with `import` blocks require a separate `terraform import` CLI run?

- A. Yes, always
- B. No, import is handled through plan and apply
- C. Only for modules
- D. Only when using local backend

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Modern import blocks integrate into the standard workflow; a separate CLI import is not required when using this approach.

</details>

---
### Question 49

If `terraform graph` is run before `terraform init`, what happens?

- A. It downloads providers automatically
- B. It may fail or produce incomplete output because providers are not installed
- C. It graphs only modules
- D. It outputs an empty graph successfully

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Graph depends on initialized configuration and provider schemas. Run `terraform init` first.

</details>

---
### Question 50

Which plan symbol indicates a resource will be updated in-place?

- A. ~
- B. +
- C. -
- D. -/+

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** `~` means in-place update. `+` create, `-` destroy, `-/+` replace, `<=` read data source.

</details>

---
### Question 51

What is a key risk of using `terraform force-unlock` incorrectly?

- A. It deletes all state backups
- B. Concurrent operations could corrupt state if another process still holds the lock
- C. It revokes cloud API credentials
- D. It removes all resources from configuration

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Force-unlock should only be used when certain the original lock holder crashed. Otherwise two applies could run simultaneously.

</details>

---
### Question 52

Can provisioners be declared inside a `module` block directly?

- A. Yes, module blocks support inline provisioners
- B. No, provisioners belong on resources, not module blocks
- C. Only in root modules
- D. Only with the null provider

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Provisioners attach to `resource` or `data` blocks (typically resources), not to `module` blocks.

</details>

---
### Question 53

What happens if a provisioner fails during apply?

- A. Terraform automatically retries three times
- B. Terraform marks the resource as tainted (legacy behavior) and the apply fails
- C. The resource is removed from state
- D. Terraform continues silently

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Provisioner failure fails the apply. Historically Terraform tainted the resource; with modern workflows you may need `-replace` to retry.

</details>

---
### Question 54

Which expression is valid inside `terraform console`?

- A. var.instance_type
- B. terraform apply
- C. provider "aws" {}
- D. resource "aws_instance" "web" {}

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Console evaluates expressions—not full configuration blocks or CLI commands.

</details>

---
### Question 55

When using `moved` blocks, must you run a special command beyond plan and apply?

- A. Yes, terraform state mv is always required
- B. No, moved blocks are processed during plan
- C. Yes, terraform refactor
- D. Yes, terraform init -migrate-moved

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Terraform 1.1+ processes `moved` blocks automatically during planning; no separate refactor command is needed.

</details>

---
### Question 56

Can `dynamic` blocks be used at the root level of a resource block (not nested)?

- A. Yes, for any attribute
- B. No, dynamic blocks only generate nested block types
- C. Only with the aws provider
- D. Only inside modules

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Dynamic blocks wrap nested block types (e.g., `ingress` in security groups), not simple scalar arguments.

</details>

---
### Question 57

What does `terraform graph -type=plan` emphasize compared to the default graph?

- A. Only provider nodes
- B. Resources with planned changes rather than the full dependency graph
- C. Module registry metadata
- D. State lock history

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** The `-type` flag changes graph output; `plan` focuses on resources affected by the current plan context.

</details>

---
### Question 58

When using `import` blocks, can Terraform generate resource configuration automatically?

- A. Never
- B. Yes, when using `terraform plan -generate-config-out=<file>`
- C. Only via terraform console
- D. Only for module imports

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Plan with `-generate-config-out` writes suggested HCL for imported resources to the specified file.

</details>

---
### Question 59

Which lifecycle hook can run a provisioner when a resource is destroyed?

- A. when = destroy on the provisioner block
- B. on_destroy in the resource block
- C. terraform destroy -provisioner
- D. prevent_destroy = true

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Provisioners accept `when = destroy` to run during resource destruction (rare; still discouraged).

</details>

---
### Question 60

In a dynamic block, what is the default iterator name if `iterator` is omitted?

- A. item
- B. each
- C. The label of the dynamic block (e.g., ingress for `dynamic "ingress"`)
- D. self

<details>
<summary>View Answer</summary>

**Correct Answer: C**

**Explanation:** If omitted, the iterator object is named after the dynamic block label, accessible as `ingress.value`, etc.

</details>

---
