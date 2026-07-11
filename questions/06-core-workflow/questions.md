# Use the Core Terraform Workflow

> **Exam Domain:** Use the Core Terraform Workflow | **Weight:** 8-10%
> **Questions:** 60 | **Format:** Multiple choice & multi-select (like Terraform Associate 004)

Covers init, validate, fmt, plan, apply, destroy, targeting, and the standard write-plan-apply lifecycle.

**Instructions:** Answer each question, then expand the dropdown to check your answer and explanation.

---

### Question 1

What is the first command you should run in a new Terraform working directory?

- A. terraform plan
- B. terraform init
- C. terraform apply
- D. terraform validate

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Init downloads providers/modules and configures the backend. Plan and apply require initialization first.

</details>

---
### Question 2

What does `terraform init` primarily accomplish?

- A. Applies configuration changes to the cloud
- B. Initializes the backend, installs providers, and downloads modules
- C. Formats .tf files to canonical style
- D. Destroys all managed resources

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Init prepares the working directory. It does not modify real infrastructure.

</details>

---
### Question 3

When should you use `terraform init -upgrade`?

- A. To migrate state to a new backend
- B. To upgrade providers/modules to the newest versions allowed by constraints
- C. To validate syntax only
- D. To destroy targeted resources

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `-upgrade` re-checks registry for newer provider/module versions permitted by your version constraints.

</details>

---
### Question 4

What does `terraform init -migrate-state` do?

- A. Copies .tf files to a new directory
- B. Reconfigures the backend and migrates existing state to the new backend
- C. Upgrades Terraform CLI version
- D. Imports all cloud resources automatically

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Use `-migrate-state` when changing backend configuration so Terraform moves state to the new storage location.

</details>

---
### Question 5

What does `terraform validate` check?

- A. Whether cloud credentials are valid
- B. Configuration syntax and internal consistency without accessing remote services
- C. Whether .tf files match canonical formatting
- D. Whether the saved plan matches current state

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Validate checks HCL syntax and logical consistency. It does not verify credentials or API connectivity.

</details>

---
### Question 6

What is the purpose of `terraform fmt`?

- A. Validate provider schemas
- B. Rewrite .tf files to canonical formatting style
- C. Generate an execution plan
- D. Lock state for concurrent runs

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `fmt` standardizes formatting (indentation, spacing). It does not change resource logic.

</details>

---
### Question 7

What does `terraform fmt -check` do?

- A. Checks syntax errors only
- B. Reports if files need formatting without modifying them (non-zero exit if changes needed)
- C. Checks remote API connectivity
- D. Validates variable types

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `-check` is CI-friendly: exit 0 if formatted, non-zero if reformatting would be needed.

</details>

---
### Question 8

Why use `terraform fmt -recursive`?

- A. Format .tf files in subdirectories as well as the current directory
- B. Recursively destroy nested modules
- C. Re-run init in all child folders
- D. Validate all modules in the registry

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** `-recursive` walks subdirectories applying formatting—useful for monorepos with nested config.

</details>

---
### Question 9

Which statements distinguish validate from fmt? Select all that apply.

- A. validate checks syntax and consistency
- B. fmt changes file formatting
- C. validate requires cloud API access
- D. fmt -check is useful in CI pipelines

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, D**

**Explanation:** Validate does not need cloud access. fmt formats files; `-check` verifies formatting without writing.

</details>

---
### Question 10

Does `terraform plan` modify real infrastructure?

- A. Yes, it creates a partial deployment
- B. No, it only shows a proposed execution plan
- C. Only when using -auto-approve
- D. Only for data sources

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Plan is read-only regarding infrastructure. Changes happen only on apply.

</details>

---
### Question 11

How do you save a plan to a file for later apply?

- A. terraform plan -save=plan.tfplan
- B. terraform plan -out=plan.tfplan
- C. terraform apply -out=plan.tfplan
- D. terraform plan > plan.tfplan

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Use `terraform plan -out=<file>` to save a binary plan. Apply it with `terraform apply <file>`.

</details>

---
### Question 12

What does `terraform plan -destroy` show?

- A. A plan to create all resources
- B. A plan showing resources that would be destroyed
- C. A plan to import existing resources
- D. A plan to format configuration files

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `-destroy` previews destruction of all managed resources (similar goal to destroy command).

</details>

---
### Question 13

How do you apply a previously saved plan file?

- A. terraform apply -plan=plan.tfplan
- B. terraform apply plan.tfplan
- C. terraform plan -apply plan.tfplan
- D. terraform init plan.tfplan

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Run `terraform apply plan.tfplan`. The saved plan locks exact changes; no interactive approval for the plan content.

</details>

---
### Question 14

What does `terraform apply -auto-approve` do?

- A. Skips the interactive approval prompt
- B. Automatically runs terraform init first
- C. Approves only destroy operations
- D. Disables state locking

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** `-auto-approve` applies without asking `yes`. Dangerous in production—changes proceed immediately.

</details>

---
### Question 15

When is `terraform apply -target` appropriate?

- A. As the default for every apply
- B. Only for exceptional cases; it can leave infrastructure in a partial state
- C. Never, it is removed in Terraform 1.0
- D. Only during terraform destroy

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Targeting limits apply scope. Exam expects you to know it exists but risks dependency inconsistencies.

</details>

---
### Question 16

How do you pass a variable on the command line during apply?

- A. terraform apply -var name=value
- B. terraform apply -var="name=value"
- C. terraform apply --variable name:value
- D. terraform apply -Dname=value

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Use `-var="name=value"` or `-var-file=filename` on plan/apply/destroy commands.

</details>

---
### Question 17

What does `terraform apply -var-file=prod.tfvars` do?

- A. Creates a new tfvars file
- B. Loads variable values from the specified file for this run
- C. Exports outputs to prod.tfvars
- D. Validates prod.tfvars syntax only

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `-var-file` supplies variable values. Multiple `-var-file` flags can be used; later files override earlier.

</details>

---
### Question 18

Which plan output symbols are correct? Select all that apply.

- A. + means create
- B. - means destroy
- C. ~ means replace
- D. <= means read (data source)

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, D**

**Explanation:** `~` means update in-place. `-/+` means replace (destroy then create). `<=` indicates data source read.

</details>

---
### Question 19

What does the `-/+` symbol in plan output indicate?

- A. Resource will be updated in-place
- B. Resource will be destroyed and recreated
- C. Resource will be imported
- D. Data source will be refreshed only

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `-/+` signals forced replacement: destroy existing resource and create a new one.

</details>

---
### Question 20

What does `terraform destroy` do?

- A. Deletes .terraform directory only
- B. Creates a destroy plan and removes all managed infrastructure after confirmation
- C. Removes resources from state without cloud changes
- D. Formats and validates configuration

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `destroy` is a convenience wrapper that plans and applies destruction of all resources in the configuration.

</details>

---
### Question 21

How does `terraform apply -destroy` differ from `terraform destroy`?

- A. They are unrelated commands
- B. Both produce destroy plans; destroy is shorthand while apply -destroy uses the apply code path
- C. apply -destroy only destroys targeted resources
- D. destroy requires a saved plan file

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Both initiate destruction. `terraform destroy` is essentially `apply` with destroy semantics. Know both for the exam.

</details>

---
### Question 22

Can you use `-target` with `terraform destroy`?

- A. No
- B. Yes, to destroy specific resources
- C. Only with local backend
- D. Only on HCP Terraform

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `terraform destroy -target=<address>` destroys only the targeted resource and its dependencies.

</details>

---
### Question 23

What is the correct core workflow order?

- A. apply → init → plan → write
- B. write → init → plan → apply
- C. init → write → destroy → plan
- D. validate → apply → init → plan

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Standard workflow: author configuration, initialize, preview with plan, then apply changes.

</details>

---
### Question 24

Must you run `terraform init` again after only changing resource arguments (no new providers/modules/backend)?

- A. Yes, always before every plan
- B. Not necessarily; init is required when providers, modules, or backend change
- C. Never after the first init
- D. Only on destroy

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Configuration changes to existing resources do not require re-init unless dependencies or backend change.

</details>

---
### Question 25

Which init flags serve these purposes? Select all that apply.

- A. -upgrade updates provider/module versions within constraints
- B. -migrate-state moves state when backend changes
- C. -auto-approve skips apply prompts
- D. init is required before first plan

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, D**

**Explanation:** `-auto-approve` belongs to apply, not init. Init must run before planning in a new directory.

</details>

---
### Question 26

If `terraform validate` succeeds, is the configuration guaranteed to deploy successfully?

- A. Yes, validate covers all runtime errors
- B. No, validate does not check real-world API errors or permissions
- C. Only with remote backend
- D. Only for modules

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Validate catches syntax and reference errors, not cloud quota limits, IAM denials, or network issues discovered at apply.

</details>

---
### Question 27

Does `terraform fmt` modify resource logic or attribute values?

- A. Yes, it optimizes expressions
- B. No, it only changes whitespace and formatting
- C. It removes unused resources
- D. It updates provider versions

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** fmt is cosmetic. It does not alter what infrastructure will be created.

</details>

---
### Question 28

What exit code does `terraform fmt -check` return when files need formatting?

- A. 0
- B. Non-zero (3 in recent Terraform versions)
- C. 1 only for syntax errors
- D. It never returns non-zero

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `-check` returns non-zero when formatting differs—used in CI to enforce style.

</details>

---
### Question 29

Can `terraform plan` run without `terraform init`?

- A. Yes, always
- B. No, init must have been run successfully first
- C. Only with -refresh-only
- D. Only for destroy plans

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Plan requires initialized providers and backend. Uninitialized directories error on plan.

</details>

---
### Question 30

When applying a saved plan file, can you add new `-var` flags?

- A. Yes, to override the plan
- B. No, the saved plan is fixed; variables were resolved when the plan was created
- C. Only with -auto-approve
- D. Only for destroy plans

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Saved plans encapsulate decisions made at plan time. Apply the plan file as-is without altering variables.

</details>

---
### Question 31

Which apply flags are valid? Select all that apply.

- A. -auto-approve
- B. -target=aws_instance.web
- C. -var="env=prod"
- D. -generate-config-out

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, C**

**Explanation:** `-generate-config-out` is a plan flag for import workflows, not an apply flag.

</details>

---
### Question 32

What does the `+` symbol mean in plan output?

- A. Destroy
- B. Create
- C. Read
- D. No-op

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `+` indicates a resource will be created.

</details>

---
### Question 33

What does the `-` symbol mean in plan output?

- A. Create
- B. Destroy
- C. In-place update
- D. Import

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `-` means the resource will be destroyed.

</details>

---
### Question 34

What does `~` mean in plan output?

- A. In-place update
- B. Replace
- C. Create
- D. Ignore

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** `~` on attributes shows in-place modification. Resource-level `-/+` indicates replacement.

</details>

---
### Question 35

What does `<=` indicate in plan output?

- A. Module download
- B. Data source read during plan
- C. State migration
- D. Provider upgrade

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `<=` appears for data sources that will be read during the plan/apply cycle.

</details>

---
### Question 36

Is `terraform destroy` interactive by default?

- A. No, it always auto-approves
- B. Yes, it prompts for confirmation unless -auto-approve is used
- C. It never prompts
- D. Only with remote backend

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Like apply, destroy asks for confirmation unless `-auto-approve` is passed.

</details>

---
### Question 37

Can `terraform plan` accept `-var-file`?

- A. No, only apply
- B. Yes, plan and apply both accept -var and -var-file
- C. Only destroy accepts var files
- D. Only init accepts var files

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Variable flags work on plan, apply, and destroy so the plan reflects chosen values.

</details>

---
### Question 38

Which commands are part of the core Write → Init → Plan → Apply workflow? Select all that apply.

- A. terraform init
- B. terraform plan
- C. terraform graph
- D. terraform apply

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, D**

**Explanation:** graph is a CLI inspection tool (domain 4), not part of the core provisioning workflow.

</details>

---
### Question 39

What happens if you run `terraform apply` without a saved plan?

- A. It fails immediately
- B. Terraform generates a new plan and prompts for approval before applying
- C. It applies without any preview
- D. It only runs validate

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Default apply shows the plan and asks for confirmation unless `-auto-approve` or applying a saved plan file.

</details>

---
### Question 40

Why save a plan with `-out` before apply in CI/CD?

- A. To skip terraform init
- B. To ensure the exact reviewed plan is what gets applied
- C. To avoid needing providers
- D. To disable state locking

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Saved plans prevent drift between review and apply—what was approved is exactly what runs.

</details>

---
### Question 41

Does `terraform destroy` run a plan first?

- A. No, it deletes immediately without preview
- B. Yes, it shows what will be destroyed before confirmation
- C. Only with -target
- D. Only for modules

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Destroy presents a destruction plan and waits for confirmation (unless auto-approved).

</details>

---
### Question 42

Can you run `terraform validate` before `terraform init`?

- A. Sometimes, but init is recommended first for full validation with providers
- B. Never under any circumstances
- C. Only after apply
- D. Validate always requires remote state

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Basic validation may work, but provider schemas often require init. Best practice: init then validate.

</details>

---
### Question 43

What is wrong with using `-auto-approve` in production CI without review?

- A. It disables providers
- B. Infrastructure changes apply without human review of the plan
- C. It prevents state locking
- D. It deletes the state file

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** The exam emphasizes `-auto-approve` skips the safety prompt—dangerous without separate plan review gates.

</details>

---
### Question 44

If backend configuration changes, which command combination is required?

- A. terraform apply -migrate-state
- B. terraform init -migrate-state
- C. terraform plan -migrate-state
- D. terraform fmt -migrate-state

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Backend changes require re-init with `-migrate-state` to move existing state to the new backend.

</details>

---
### Question 45

Which command previews changes without applying them?

- A. terraform apply
- B. terraform plan
- C. terraform init
- D. terraform fmt

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Plan is the preview step. Apply executes changes.

</details>

---
### Question 46

What does `terraform apply -destroy` require before running?

- A. A saved destroy plan file only
- B. Successful init; it then plans destruction like other apply operations
- C. terraform import first
- D. Removing all output blocks

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Apply -destroy needs an initialized directory and follows normal apply flow with destroy semantics.

</details>

---
### Question 47

Are `-var` flags available on `terraform plan`?

- A. No
- B. Yes
- C. Only on destroy
- D. Only in HCP Terraform

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Pass variables at plan time so the preview matches values used at apply.

</details>

---
### Question 48

What is the relationship between `terraform plan -destroy` and `terraform destroy`?

- A. Unrelated
- B. Both preview destruction; destroy wraps planning and applying destruction
- C. plan -destroy applies changes
- D. destroy cannot target resources

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `-destroy` on plan previews deletes. `terraform destroy` automates the full destroy workflow.

</details>

---
### Question 49

Which statements about destroy operations are true? Select all that apply.

- A. terraform destroy removes managed infrastructure
- B. terraform apply -destroy also plans destruction
- C. destroy -target limits scope
- D. destroy skips planning entirely

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, C**

**Explanation:** Destroy shows a plan before proceeding unless auto-approved. It does not skip planning.

</details>

---
### Question 50

After `terraform init -upgrade`, what should you run to preview resulting changes?

- A. terraform fmt only
- B. terraform plan
- C. terraform force-unlock
- D. terraform console only

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** After upgrading providers/modules, run plan to see how dependency updates affect infrastructure.

</details>

---
### Question 51

Which workflow step catches unformatted HCL in CI?

- A. terraform validate
- B. terraform fmt -check
- C. terraform plan
- D. terraform init

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Use `fmt -check` in CI to enforce formatting. validate does not check style.

</details>

---
### Question 52

Can `terraform apply` use multiple `-var-file` arguments?

- A. No, only one file
- B. Yes, later files override earlier ones for duplicate keys
- C. Only with JSON vars
- D. Only at init

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Multiple `-var-file` flags merge with later files taking precedence for duplicate variable names.

</details>

---
### Question 53

What is the primary risk of relying on `-target` for routine deployments?

- A. It deletes the state file
- B. Dependencies may be ignored, leaving infrastructure inconsistent
- C. It prevents provider download
- D. It disables outputs

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Targeted operations bypass full graph ordering—acceptable for emergencies, not standard workflow.

</details>

---
### Question 54

Does `terraform plan -out` lock the variable values used at plan time?

- A. No, variables are re-resolved at apply
- B. Yes, the saved plan captures the planned changes with resolved values
- C. Only for modules
- D. Only with local backend

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** The saved plan file preserves the planned action set; apply uses that frozen plan.

</details>

---
### Question 55

Which command should run after editing .tf files to fix indentation before commit?

- A. terraform validate
- B. terraform fmt
- C. terraform apply
- D. terraform destroy

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `terraform fmt` (often with `-recursive`) standardizes formatting before version control.

</details>

---
### Question 56

Can `terraform plan` and `terraform apply` use `-input=false`?

- A. No, input flags do not exist
- B. Yes, to disable interactive prompts for variables
- C. Only apply supports it
- D. Only with HCP Terraform

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `-input=false` prevents CLI prompts for undefined variables—useful in automation when all values are provided via files/flags.

</details>

---
### Question 57

What does running `terraform apply` with no arguments do after you decline the confirmation prompt?

- A. Applies partial changes
- B. Cancels the apply; no changes are made
- C. Saves the plan automatically
- D. Runs destroy instead

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Answering `no` aborts apply. No infrastructure changes occur.

</details>

---
### Question 58

Is `terraform destroy` required to remove a single resource while keeping others?

- A. Yes, destroy always removes everything
- B. No, you can use destroy -target or remove the resource from config and apply
- C. Only terraform state rm works
- D. Only HCP Terraform supports selective removal

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Selective removal: delete the resource block and apply, or use `destroy -target`. Full destroy is not required.

</details>

---
### Question 59

Which command checks configuration without contacting the cloud provider APIs?

- A. terraform plan
- B. terraform validate
- C. terraform apply
- D. terraform refresh

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Validate is local. Plan may contact providers for refresh unless `-refresh=false`.

</details>

---
### Question 60

After changing only `terraform.tfvars`, must you run init again before plan?

- A. Yes, always
- B. No, variable value changes do not require re-init
- C. Only with remote backend
- D. Only if using modules

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Variable values are evaluated at plan/apply. Init is not needed solely for tfvars changes.

</details>

---
