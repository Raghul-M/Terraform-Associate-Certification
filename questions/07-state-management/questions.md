# Implement and Maintain State

> **Exam Domain:** Implement and Maintain State | **Weight:** 12-15%
> **Questions:** 60 | **Format:** Multiple choice & multi-select (like Terraform Associate 004)

Covers why state exists, sensitive data, remote backends, locking, state subcommands, refresh-only, and backend migration.

**Instructions:** Answer each question, then expand the dropdown to check your answer and explanation.

---

### Question 1

Why does Terraform maintain a state file?

- A. To store provider plugin binaries
- B. To map configuration to real-world resource IDs and track metadata
- C. To replace the need for providers
- D. To encrypt all cloud API credentials

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** State maps Terraform addresses to real resource IDs, stores metadata/dependencies, caches attributes, and enables collaboration via remote backends.

</details>

---
### Question 2

Which is NOT a primary reason Terraform maintains state?

- A. Mapping resources in config to real infrastructure IDs
- B. Caching resource attributes for performance
- C. Storing provider source code for offline use
- D. Enabling team collaboration through remote state

<details>
<summary>View Answer</summary>

**Correct Answer: C**

**Explanation:** State maps, caches, and enables collaboration. Provider plugins live in .terraform/, not state.

</details>

---
### Question 3

What does Terraform state cache help improve?

- A. Provider download speed only
- B. Performance by storing resource attributes Terraform already knows
- C. HCL syntax validation
- D. Module version resolution

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Cached attributes reduce repeated API calls during plan/apply operations.

</details>

---
### Question 4

How does remote state primarily help teams collaborate?

- A. By compiling HCL into JSON automatically
- B. By providing a shared, consistent view of managed infrastructure
- C. By eliminating the need for version control
- D. By running apply locally on every engineer's laptop

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Remote backends let teams share one authoritative state so everyone plans against the same reality.

</details>

---
### Question 5

Terraform state tracks which of the following?

- A. Only resource names from configuration
- B. Resource IDs, dependencies, and provider metadata
- C. Only output values
- D. Only variable default values

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** State records resource IDs, dependency graphs, serial/version info, and provider lineage.

</details>

---
### Question 6

Without a state file, what problem would Terraform face on the next plan?

- A. It could not download providers
- B. It would not know which real resources correspond to configuration addresses
- C. It would skip validation
- D. It would always destroy all resources

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** State is the mapping layer between HCL addresses and real infrastructure identifiers.

</details>

---
### Question 7

State metadata is useful because it allows Terraform to:

- A. Skip the plan phase entirely
- B. Understand dependencies between resources during graph walks
- C. Automatically write modules
- D. Bypass provider authentication

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Dependency metadata drives correct create/update/destroy ordering.

</details>

---
### Question 8

Which statement about state and performance is correct?

- A. State has no performance role
- B. State caches known attributes so Terraform avoids redundant lookups where possible
- C. State disables provider caching
- D. State only affects destroy operations

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Cached values speed planning by reducing API round-trips.

</details>

---
### Question 9

How is sensitive data stored inside the Terraform state file?

- A. Always encrypted and unreadable in the file
- B. In plaintext unless the backend encrypts at rest
- C. Only as bcrypt hashes
- D. Only in environment variables, never in state

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Terraform marks values sensitive in CLI output, but state itself stores values in plaintext. Encrypt backends and restrict access.

</details>

---
### Question 10

Marking a variable as sensitive affects state storage how?

- A. It prevents the value from being written to state
- B. It hides the value in CLI logs/output but the value may still exist in state
- C. It automatically encrypts the value in state
- D. It removes the variable from configuration

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** sensitive affects display/redaction in CLI; state can still contain the plaintext secret.

</details>

---
### Question 11

What is a best practice for secrets in Terraform state?

- A. Commit state to Git for backup
- B. Use remote backends with encryption at rest and strict access controls
- C. Store secrets only in comments
- D. Disable state locking

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Encrypt remote state, restrict IAM/access, and never commit state files.

</details>

---
### Question 12

An output is marked sensitive=true. Where might the value still appear in plaintext?

- A. Nowhere; Terraform never persists it
- B. In the state file
- C. Only in terraform validate output
- D. Only in .terraform.lock.hcl

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Sensitive outputs are redacted in CLI but can still be stored in state.

</details>

---
### Question 13

Which exam trap is correct about sensitive resources?

- A. sensitive = true on a variable removes it from state
- B. State always stores attribute values in plaintext on disk
- C. Remote state backends never store secrets
- D. terraform show never reveals sensitive values from state

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Exam trap: sensitive flags affect display, not state persistence. Always encrypt backends.

</details>

---
### Question 14

In an AWS S3 remote backend, which setting enables state locking with DynamoDB?

- A. encrypt = true
- B. dynamodb_table = "locks-table"
- C. acl = "private"
- D. versioning = true

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** dynamodb_table points to the DynamoDB table used as a lock ID store for concurrent operations.

</details>

---
### Question 15

What does encrypt = true on an S3 backend do?

- A. Encrypts provider plugins
- B. Enables server-side encryption for the state object in S3
- C. Encrypts HCL source files
- D. Replaces the need for DynamoDB locking

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** encrypt enables SSE for the state object at rest in S3.

</details>

---
### Question 16

Which pair is a common production remote backend setup on AWS?

- A. S3 for state storage and DynamoDB for locking
- B. EC2 for state storage and RDS for locking
- C. Lambda for state storage and SNS for locking
- D. CloudWatch for state storage and IAM for locking

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** S3 stores state; DynamoDB provides conditional writes for lock IDs.

</details>

---
### Question 17

Backend configuration for S3 belongs in which block?

- A. provider "aws"
- B. terraform { backend "s3" { ... } }
- C. resource "aws_s3_bucket"
- D. variable "backend"

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Backend settings are declared inside terraform { backend "s3" { ... } }.

</details>

---
### Question 18

Can backend configuration use arbitrary Terraform variables directly?

- A. Yes, always
- B. No; backend blocks cannot reference variables or module outputs
- C. Only for the bucket name
- D. Only in Terraform 1.5+

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Backend blocks must be statically configured or use -backend-config files/flags at init.

</details>

---
### Question 19

Why is state locking important?

- A. It speeds up terraform fmt
- B. It prevents concurrent apply operations from corrupting state
- C. It encrypts variables
- D. It validates provider schemas

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Locks ensure only one writer modifies state at a time.

</details>

---
### Question 20

What happens if a second user runs terraform apply while a lock is held?

- A. Apply proceeds normally
- B. Terraform blocks with a lock error until the lock is released
- C. Terraform deletes the lock automatically
- D. Terraform migrates state silently

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Concurrent writers are blocked to prevent state corruption.

</details>

---
### Question 21

Which command manually releases a stuck state lock?

- A. terraform unlock
- B. terraform force-unlock <LOCK_ID>
- C. terraform state rm --unlock
- D. terraform init -unlock

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** force-unlock should only be used when you're certain no other operation is running.

</details>

---
### Question 22

When is terraform force-unlock appropriate?

- A. Whenever apply is slow
- B. When a lock remains after a crashed process and no other operation is active
- C. Before every plan
- D. To bypass Sentinel policies

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Use only when the holding process is gone; forcing unlock during active runs risks corruption.

</details>

---
### Question 23

Local backend default behavior regarding locking:

- A. Uses DynamoDB automatically
- B. Provides no real locking for team scenarios
- C. Uses Git locks
- D. Requires Consul

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Local state on disk has no distributed lock; teams should use remote backends with locking.

</details>

---
### Question 24

What does terraform state list do?

- A. Destroys all listed resources
- B. Lists resource addresses currently tracked in state
- C. Lists all .tf files
- D. Lists provider mirrors

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** state list prints addresses of resources in the current state.

</details>

---
### Question 25

What does terraform state show <address> do?

- A. Shows the resource's current state attributes for that address
- B. Shows the provider README
- C. Shows only the plan file
- D. Deletes the resource from the cloud

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** state show displays stored attributes for one resource address.

</details>

---
### Question 26

terraform state pull is used to:

- A. Upload local state to remote
- B. Download remote state and output it to stdout
- C. Delete remote state
- D. Import a resource

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** state pull fetches remote state for inspection or backup.

</details>

---
### Question 27

terraform state push is considered dangerous because:

- A. It always destroys resources
- B. It can overwrite remote state with local state, bypassing normal safety checks
- C. It removes locks permanently
- D. It disables providers

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Push can clobber remote state; use only in controlled recovery scenarios.

</details>

---
### Question 28

terraform state replace-provider is used when:

- A. Renaming a resource in configuration
- B. Migrating state records from one provider source to another
- C. Destroying a provider
- D. Locking state

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** replace-provider rewrites provider addresses in state during provider source migrations.

</details>

---
### Question 29

Which command shows human-readable state or a saved plan file?

- A. terraform graph
- B. terraform show
- C. terraform get
- D. terraform providers mirror

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** terraform show renders state or a plan file in readable form.

</details>

---
### Question 30

terraform show plan.tfplan displays:

- A. Only provider versions
- B. The contents of a saved plan file
- C. Only outputs
- D. Only variables

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Pass a saved plan file to inspect planned changes offline.

</details>

---
### Question 31

What does terraform state rm <address> do?

- A. Destroys the real cloud resource and removes it from state
- B. Removes the resource from state only; the real resource continues to exist
- C. Removes the .tf configuration block
- D. Replaces the provider

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** state rm detaches management; it does NOT destroy infrastructure. Classic exam trap.

</details>

---
### Question 32

After terraform state rm, the real infrastructure:

- A. Is always deleted
- B. Still exists but is no longer managed by Terraform
- C. Is automatically imported
- D. Is tainted

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** The resource becomes orphaned from Terraform's perspective.

</details>

---
### Question 33

Why might you use terraform state rm?

- A. To safely delete cloud resources
- B. To stop managing a resource without destroying it
- C. To rename resources
- D. To refresh state

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Useful when handing off resources or fixing mistaken imports without destroy.

</details>

---
### Question 34

terraform state mv is primarily used to:

- A. Destroy and recreate resources
- B. Rename or move a resource address in state without changing real infrastructure
- C. Download providers
- D. Change backend type automatically

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** state mv updates addresses in state for refactors without API changes.

</details>

---
### Question 35

When refactoring a resource name in HCL, which avoids destroy/recreate?

- A. Only editing the name with no state action
- B. terraform state mv old.address new.address (or moved blocks in config)
- C. terraform destroy
- D. terraform taint

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** state mv (or moved blocks) preserves the real resource while updating tracking.

</details>

---
### Question 36

terraform state mv affects:

- A. Only the state file address mapping
- B. The actual cloud resource ID
- C. Provider plugin versions
- D. Backend bucket name

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** mv changes Terraform's tracking address, not the real resource identifier.

</details>

---
### Question 37

Which command is the recommended replacement for the deprecated terraform refresh?

- A. terraform plan -refresh-only
- B. terraform apply -auto-approve
- C. terraform validate
- D. terraform fmt

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** plan -refresh-only previews drift reconciliation; apply -refresh-only applies only refresh changes.

</details>

---
### Question 38

What does terraform plan -refresh-only do?

- A. Creates new resources only
- B. Updates state from real infrastructure and shows drift without other planned changes
- C. Deletes all resources
- D. Formats configuration

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Refresh-only mode syncs state with reality and reports differences.

</details>

---
### Question 39

terraform refresh is:

- A. The preferred modern workflow command
- B. Deprecated in favor of plan/apply -refresh-only
- C. Required before every init
- D. Identical to terraform destroy

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Exam focus: refresh is deprecated; use -refresh-only variants.

</details>

---
### Question 40

terraform apply -refresh-only will:

- A. Apply all pending configuration changes
- B. Apply only state refresh changes to match real infrastructure
- C. Skip state updates
- D. Remove locks

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** It updates state to reflect real-world attributes without other changes.

</details>

---
### Question 41

Default local backend stores state:

- A. In HCP Terraform only
- B. As terraform.tfstate in the working directory
- C. Inside provider binaries
- D. Only in RAM

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Local backend writes terraform.tfstate (and backup) locally.

</details>

---
### Question 42

A key disadvantage of local state for teams is:

- A. It cannot work with providers
- B. No built-in shared locking/collaboration across machines
- C. It disables modules
- D. It prevents variables

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Local files are hard to share safely; remote backends solve collaboration.

</details>

---
### Question 43

Remote backends primarily provide:

- A. Automatic HCL generation
- B. Centralized durable storage and often locking for state
- C. Free cost estimation locally
- D. Sentinel execution locally

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Remote storage plus locking underpins team workflows.

</details>

---
### Question 44

After changing backend configuration, which command migrates existing state?

- A. terraform apply -migrate
- B. terraform init -migrate-state
- C. terraform state mv --migrate
- D. terraform get -migrate

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** init -migrate-state copies state to the new backend during reinitialization.

</details>

---
### Question 45

terraform init -migrate-state prompts you when:

- A. Providers are missing
- B. Terraform detects existing state that should move to a new backend
- C. Variables are undefined
- D. Modules change names

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** During backend changes, init offers to migrate existing state to the new backend.

</details>

---
### Question 46

Backend migration with -migrate-state copies:

- A. Only .tf files
- B. Existing state to the newly configured backend
- C. Provider plugins to S3
- D. Only lock table entries

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Migration transfers state content so tracking continues uninterrupted.

</details>

---
### Question 47

Should terraform.tfstate be committed to version control?

- A. Yes, always
- B. No; it may contain secrets and is environment-specific
- C. Only if encrypted with gpg
- D. Only for modules

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Never commit state; use remote backends and secret management.

</details>

---
### Question 48

terraform.tfstate.backup is created:

- A. Before state-modifying operations as a safety copy
- B. Only during fmt
- C. Only in HCP Terraform
- D. Never

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Terraform maintains a backup before rewriting state.

</details>

---
### Question 49

Which file should be committed related to dependencies?

- A. .terraform/
- B. .terraform.lock.hcl
- C. terraform.tfstate
- D. terraform.tfstate.backup

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Lock file pins provider versions; state files must not be committed.

</details>

---
### Question 50

State locking with DynamoDB relies on:

- A. Conditional writes / lock records identified by a lock ID
- B. S3 object versioning alone
- C. Git hooks
- D. terraform workspace names

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** DynamoDB stores lock metadata; S3 alone does not provide Terraform locking.

</details>

---
### Question 51

If two applies run concurrently without locking, risk is:

- A. Slower fmt
- B. State corruption or lost updates
- C. Provider download failure
- D. Invalid HCL

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Race conditions can corrupt the single source of truth.

</details>

---
### Question 52

terraform state show is different from terraform show because state show:

- A. Shows one resource address from state; terraform show can display entire state or a plan file
- B. Always destroys resources
- C. Only works remotely
- D. Requires -replace

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** state show targets one address; terraform show is broader.

</details>

---
### Question 53

To inspect entire current state in terminal, use:

- A. terraform state list only
- B. terraform show
- C. terraform validate
- D. terraform fmt -check

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** terraform show prints human-readable state (or a plan if given a plan file).

</details>

---
### Question 54

terraform show -json outputs:

- A. Only ASCII art
- B. JSON representation of state or plan
- C. Provider licenses
- D. Only variables

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** JSON form is useful for tooling and CI pipelines.

</details>

---
### Question 55

Why does Terraform maintain state? (Select all that apply.)

- A. Map configuration addresses to real resource IDs
- B. Store provider plugin binaries for offline use
- C. Cache resource attributes for performance
- D. Track metadata and dependencies
- E. Enable collaboration via shared remote state

<details>
<summary>View Answer</summary>

**Correct Answers: A, C, D, E**

**Explanation:** State maps, caches, tracks metadata/deps, and enables collaboration. Provider binaries are not stored in state.

</details>

---
### Question 56

Which statements about sensitive data and state are true? (Select all that apply.)

- A. State may contain secrets in plaintext on disk
- B. sensitive = true prevents values from ever being stored in state
- C. Encrypting remote backends helps protect data at rest
- D. terraform.tfstate should not be committed to VCS
- E. Sensitive flags primarily affect CLI redaction

<details>
<summary>View Answer</summary>

**Correct Answers: A, C, D, E**

**Explanation:** Sensitive marks redact CLI output; values can still be in plaintext state. Encrypt backends and never commit state.

</details>

---
### Question 57

Which terraform state subcommands are valid? (Select all that apply.)

- A. terraform state list
- B. terraform state show
- C. terraform state mv
- D. terraform state destroy
- E. terraform state replace-provider

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, C, E**

**Explanation:** Valid subcommands include list, show, mv, rm, pull, push, replace-provider. There is no state destroy.

</details>

---
### Question 58

Which statements about state locking are correct? (Select all that apply.)

- A. Locking prevents concurrent writes from corrupting state
- B. S3 alone provides Terraform-native locking without DynamoDB
- C. terraform force-unlock should be used cautiously
- D. Local backends offer distributed team locking by default
- E. A stuck lock from a crashed process may require force-unlock

<details>
<summary>View Answer</summary>

**Correct Answers: A, C, E**

**Explanation:** S3 needs DynamoDB (or another mechanism) for locking; local backends lack team locking.

</details>

---
### Question 59

Which pairs are correct for state operations? (Select all that apply.)

- A. state rm — removes from state only, does not destroy
- B. state mv — refactor addresses without destroying real resources
- C. state rm — destroys cloud resource and removes state
- D. state push — can overwrite remote state dangerously
- E. import — brings existing infrastructure under management

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, D, E**

**Explanation:** state rm does NOT destroy. import manages existing infra. state push is dangerous.

</details>

---
### Question 60

Which statements about refresh and backends are true? (Select all that apply.)

- A. terraform refresh is deprecated
- B. plan -refresh-only previews drift reconciliation
- C. init -migrate-state moves state when changing backends
- D. Remote backends help teams share state
- E. Backend blocks can reference var.backend_name directly

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, C, D**

**Explanation:** Backend blocks cannot reference variables. Refresh is deprecated; use -refresh-only.

</details>

---
