# Understand Terraform Basics

> **Exam Domain:** Understand Terraform Basics | **Weight:** 10-12%
> **Questions:** 60 | **Format:** Multiple choice & multi-select (like Terraform Associate 004)

Covers HCL syntax, project structure, providers, versioning, terraform block, and initialization concepts.

**Instructions:** Answer each question, then expand the dropdown to check your answer and explanation.

---

### Question 1

What does HCL stand for in Terraform?

- A. HashiCorp Configuration Language
- B. Hypertext Cloud Language
- C. Hosted Compute Layer
- D. Hardware Control Logic

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** HCL is HashiCorp Configuration Language, designed for structured configuration including Terraform.

</details>

---
### Question 2

Which file commonly contains primary resource definitions?

- A. outputs.tf
- B. main.tf
- C. terraform.tfstate
- D. .terraform.lock.hcl

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** main.tf traditionally holds core resources, though Terraform loads all .tf files in the directory.

</details>

---
### Question 3

Where are input variables typically declared?

- A. variables.tf
- B. terraform.tfstate
- C. .terraform/providers/
- D. terraform.tfplan only

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** variables.tf (or any .tf file) declares variable blocks; values may come from tfvars or CLI.

</details>

---
### Question 4

What is the purpose of outputs.tf?

- A. Declare output values to expose after apply
- B. Store provider plugin binaries
- C. Lock provider versions automatically
- D. Replace the need for variables

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Output blocks expose selected values (e.g., IPs, IDs) after infrastructure changes.

</details>

---
### Question 5

terraform.tfvars is commonly used to:

- A. Assign values to input variables
- B. Store remote state
- C. Download provider plugins
- D. Replace terraform init

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** tfvars files supply variable values; Terraform auto-loads terraform.tfvars if present.

</details>

---
### Question 6

The providers.tf file typically contains:

- A. Provider configuration blocks
- B. Only output definitions
- C. The state file in JSON
- D. Compiled Go binaries

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Provider settings (region, credentials aliases) are often placed in providers.tf for organization.

</details>

---
### Question 7

versions.tf commonly holds:

- A. terraform block with required_version and required_providers
- B. Only SSH private keys
- C. Runtime state of all resources
- D. Ansible inventory hosts

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Version constraints for Terraform CLI and providers are declared in the terraform block.

</details>

---
### Question 8

What is stored in the .terraform/ directory?

- A. Downloaded provider plugins and module sources after init
- B. Git repository metadata only
- C. Production secrets that must be committed
- D. The authoritative remote state file always

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** .terraform/ is created by init and contains plugins and module caches; it is generally not committed.

</details>

---
### Question 9

What is the purpose of .terraform.lock.hcl?

- A. Lock provider dependency versions for consistent init across machines
- B. Store plaintext passwords for providers
- C. Replace terraform.tfstate
- D. Format HCL files automatically

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** The lock file records selected provider versions and checksums; commit it to VCS for consistency.

</details>

---
### Question 10

Which files should typically be committed to version control? (Select all that apply.)

- A. *.tf configuration files
- B. .terraform.lock.hcl
- C. .terraform/ directory
- D. terraform.tfvars (if it contains no secrets) or use example tfvars
- E. terraform.tfstate containing sensitive data

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, D**

**Explanation:** Commit code and lock file. Do not commit .terraform/ or unprotected state with secrets.

</details>

---
### Question 11

Which command displays the installed Terraform CLI version?

- A. terraform init
- B. terraform version
- C. terraform providers
- D. terraform show

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** terraform version prints the CLI version and can show provider requirements when run in a directory.

</details>

---
### Question 12

Terraform configuration can be written as:

- A. Only binary .tf files
- B. .tf files or .tf.json files
- C. Only Excel workbooks
- D. Only CloudFormation YAML

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Terraform accepts native HCL (.tf) or JSON syntax (.tf.json) with equivalent structure.

</details>

---
### Question 13

In a provider block, what is configured?

- A. Settings for a provider plugin such as region or credentials
- B. Only output values
- C. State backend encryption keys only
- D. Git remote URLs

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Provider blocks configure plugin behavior (region, endpoints, aliases, etc.).

</details>

---
### Question 14

required_providers inside terraform {} specifies:

- A. Which provider plugins and version constraints are needed
- B. The list of resources to destroy
- C. Ansible playbook paths
- D. CloudFormation stack names

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** required_providers declares provider sources and version constraints for the configuration.

</details>

---
### Question 15

Version constraint '= 1.6.0' means:

- A. Exactly version 1.6.0
- B. 1.6.0 or any newer version
- C. Any version below 1.6.0
- D. Approximately 1.6.x but below 2.0

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** The equals operator pins to an exact version.

</details>

---
### Question 16

Version constraint '>= 1.0' means:

- A. Only versions below 1.0
- B. Version 1.0 and any newer version
- C. Exactly 1.0 only
- D. No versions allowed

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** >= sets a minimum version with no upper bound unless combined with another constraint.

</details>

---
### Question 17

Version constraint '~> 5.0' for a provider means:

- A. >= 5.0 and < 6.0
- B. Exactly 5.0 only
- C. Any version including 6.0 and 7.0
- D. Only 4.x versions

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Pessimistic constraint ~> 5.0 allows 5.x upgrades but not 6.0 major bump.

</details>

---
### Question 18

Which operator is called the pessimistic constraint operator?

- A. ~>
- B. =>
- C. ==
- D. <>

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** ~> is commonly called pessimistic; it allows patch/minor updates within the specified bound.

</details>

---
### Question 19

Terraform loads configuration from:

- A. Only main.tf ignoring other files
- B. All .tf and .tf.json files in the working directory (unless excluded)
- C. Only files named terraform.tfvars
- D. Only the state file

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Terraform merges all configuration files in the module directory into one config.

</details>

---
### Question 20

Which statements about .terraform/ vs .terraform.lock.hcl are correct? (Select all that apply.)

- A. .terraform/ is generated by terraform init
- B. .terraform.lock.hcl should be committed for team consistency
- C. .terraform/ should usually be gitignored
- D. .terraform.lock.hcl contains downloaded plugin binaries
- E. Both are safe to delete anytime without re-running init

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, C**

**Explanation:** .terraform/ holds plugins/modules and is regenerated by init. Lock file pins versions and should be committed. Lock file does not contain binaries.

</details>

---
### Question 21

A provider source address 'hashicorp/aws' indicates:

- A. The namespace and type of the provider in the registry
- B. An Ansible role name
- C. A CloudFormation stack ID
- D. A Git branch only

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Provider sources use namespace/type format, e.g., hashicorp/aws in required_providers.

</details>

---
### Question 22

Which file should NOT be committed if it contains secrets?

- A. terraform.tfvars with plaintext credentials
- B. variables.tf with only declarations
- C. main.tf with resource blocks
- D. .terraform.lock.hcl

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** tfvars with secrets should be excluded or use secure secret injection; lock files and declarations are safe to commit.

</details>

---
### Question 23

HCL syntax uses blocks like:

- A. resource "aws_instance" "web" { ... }
- B. CREATE INSTANCE web IN aws;
- C. only JSON without quotes
- D. HTML tags for resources

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Resources use block syntax: block type, labels in quotes, and arguments in braces.

</details>

---
### Question 24

terraform.tfstate should generally:

- A. Not be committed to public VCS because it may contain sensitive data
- B. Always be committed without encryption
- C. Replace all .tf files
- D. Be edited manually as primary workflow

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** State can contain secrets and is managed via backends; avoid committing unprotected state.

</details>

---
### Question 25

required_version in terraform {} constrains:

- A. The Terraform CLI version allowed to run the configuration
- B. Only AWS API versions
- C. Git client versions only
- D. Provider download mirrors only

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** required_version sets acceptable Terraform CLI versions for the codebase.

</details>

---
### Question 26

If ~/.terraform.d/plugins is mentioned, it relates to:

- A. Filesystem mirror locations for provider plugins (advanced setups)
- B. Default location of terraform.tfstate
- C. Ansible vault password file
- D. CloudFormation template cache

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Custom plugin mirrors can use filesystem paths; normally init downloads to .terraform/.

</details>

---
### Question 27

JSON syntax Terraform files use extension:

- A. .tf.json
- B. .hcl only
- C. .yaml.tf
- D. .cfjson

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Machine-generated or JSON-preferring projects use .tf.json files.

</details>

---
### Question 28

Which is valid HCL for a terraform block snippet?

- A. terraform { required_version = ">= 1.0" }
- B. terraform => required_version: 1.0
- C. TERRAFORM BEGIN VERSION 1.0 END
- D. terraform(required_version=1.0)

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Terraform blocks use braces and = assignments in HCL syntax.

</details>

---
### Question 29

Which version constraints allow Terraform 1.5.9 but NOT 2.0.0? (Select all that apply.)

- A. ~> 1.5
- B. >= 1.0, < 2.0
- C. = 1.5.9
- D. >= 1.0
- E. ~> 1.0

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, C, E**

**Explanation:** ~> 1.5 allows 1.5.x only. >=1.0,<2.0 and ~>1.0 cap below 2.0. =1.5.9 allows only that patch. >=1.0 alone would allow 2.0.0.

</details>

---
### Question 30

Provider alias configuration enables:

- A. Multiple configurations of the same provider (e.g., multiple regions)
- B. Deleting state automatically
- C. Skipping terraform init
- D. Using HCL without blocks

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Aliases let you define multiple provider blocks of the same type for different configs.

</details>

---
### Question 31

After cloning a repo, teammates get consistent provider versions primarily by:

- A. Committing .terraform.lock.hcl and running terraform init
- B. Committing .terraform/ directory with binaries
- C. Deleting versions.tf
- D. Avoiding required_providers

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Lock file plus init ensures consistent provider selections per platform checksums.

</details>

---
### Question 32

variables.tf contains:

- A. variable blocks with types, descriptions, and defaults
- B. Only provider plugins
- C. Remote backend state data
- D. Plan files from terraform plan -out

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Input variables are declared with variable blocks, not assigned production secrets ideally.

</details>

---
### Question 33

outputs.tf exposes values such as:

- A. load_balancer_dns_name after apply
- B. provider plugin zip paths only
- C. Git commit SHAs automatically
- D. Ansible inventory groups only

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Outputs surface useful attributes for users or other systems post-apply.

</details>

---
### Question 34

Which directory appears after terraform init?

- A. .terraform/
- B. .git/hooks/
- C. node_modules/
- D. ansible/roles/ automatically

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** init creates .terraform/ with provider and module installs.

</details>

---
### Question 35

A common exam trap: all .tf files must be named main.tf. Correct statement:

- A. Terraform loads all .tf files; names are organizational conventions
- B. Only main.tf is ever read
- C. variables must be in main.tf only
- D. outputs must be in providers.tf only

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** File names are conventions for readability; Terraform merges all .tf files.

</details>

---
### Question 36

required_providers version constraints help:

- A. Prevent unexpected major provider upgrades breaking configuration
- B. Eliminate the need for terraform plan
- C. Remove authentication requirements
- D. Auto-commit state to Git

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Version constraints manage compatible provider releases.

</details>

---
### Question 37

terraform version in a configured directory may also show:

- A. Provider requirements from the terraform block
- B. The entire state file contents
- C. All AWS account passwords
- D. Ansible playbook results

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** terraform version can report required Terraform and provider versions from configuration.

</details>

---
### Question 38

HCL strings can be defined with:

- A. Double quotes for standard strings
- B. Only single quotes exclusively required
- C. Only backticks forbidden
- D. HTML entities only

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** HCL primarily uses double-quoted strings; heredocs are also supported.

</details>

---
### Question 39

Which belong in the terraform {} block? (Select all that apply.)

- A. required_version
- B. required_providers
- C. backend configuration
- D. resource "aws_instance" blocks
- E. provider "aws" region setting

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, C**

**Explanation:** terraform {} holds CLI version, providers, and backend config. Resources go in resource blocks; provider settings go in provider blocks.

</details>

---
### Question 40

Provider configuration arguments are typically:

- A. Provider-specific (e.g., region for AWS)
- B. Identical for every provider
- C. Always optional with no effect
- D. Only set in terraform.tfstate

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Each provider schema defines its own configuration attributes.

</details>

---
### Question 41

.tf.json files are useful when:

- A. Configuration is generated by another tool programmatically
- B. You want only handwritten HCL
- C. You must avoid terraform init
- D. You need to store binary secrets in Git

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** JSON syntax suits machine-generated configs; HCL is more human-friendly.

</details>

---
### Question 42

Committing .terraform/ is discouraged because:

- A. It is large, platform-specific, and reproducible via init
- B. It contains no useful data
- C. It prevents provider downloads forever
- D. It is required by HashiCorp to be public

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Plugins can be re-fetched; binaries bloat repos and may differ by OS/architecture.

</details>

---
### Question 43

Pessimistic constraint '~> 1.0' for Terraform CLI allows:

- A. 1.9.x but not 2.0.0
- B. 2.5.0
- C. 0.14.0
- D. Only 1.0.0 exactly

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** ~> 1.0 means >= 1.0 and < 2.0, allowing any 1.x release.

</details>

---
### Question 44

Which file separates variable declarations from assignments?

- A. variables.tf declares; terraform.tfvars assigns values
- B. outputs.tf declares and assigns variables
- C. providers.tf stores only state
- D. versions.tf stores only secrets

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Declarations and values are separate concepts; assignments can also come from CLI/env.

</details>

---
### Question 45

terraform init uses required_providers to:

- A. Select and download appropriate provider plugins
- B. Apply changes immediately without plan
- C. Format all JSON files
- D. Delete .terraform.lock.hcl always

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Init reads provider requirements and installs matching plugins per constraints and lock file.

</details>

---
### Question 46

A provider block without alias uses:

- A. The default provider configuration for that type
- B. No provider ever
- C. Only modules
- D. Only data sources

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Unaliased provider blocks configure the default instance used by resources unless overridden.

</details>

---
### Question 47

Which is NOT a standard Terraform project file?

- A. main.tf
- B. terraform.tfstate
- C. variables.tf
- D. outputs.tf

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** tfstate is generated at runtime; others are authored configuration files (tfstate is not source config).

</details>

---
### Question 48

Which statements about provider blocks are TRUE? (Select all that apply.)

- A. They configure provider plugin behavior
- B. They can use aliases for multiple configs
- C. They replace required_providers entirely
- D. They are separate from resource blocks
- E. They must always be in main.tf only

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, D**

**Explanation:** Provider blocks configure plugins and can use aliases. required_providers still declares sources/versions. File placement is convention.

</details>

---
### Question 49

Version constraint '>= 1.2, < 2.0' means:

- A. 1.2 <= version < 2.0
- B. Only exactly 1.2
- C. Any version including 3.0
- D. No versions satisfy it

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Compound constraints combine lower and upper bounds.

</details>

---
### Question 50

HCL comments can be written as:

- A. # line comment or // line comment
- B. only <!-- HTML comments -->
- C. only C block comments /* forbidden */
- D. no comments allowed

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** HCL supports # and // line comments; /* */ block comments are also supported.

</details>

---
### Question 51

terraform.tfvars.json is:

- A. A JSON-formatted variable values file Terraform can load
- B. The provider lock file
- C. A replacement for terraform init
- D. A state backup only

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Variable values can be supplied via HCL tfvars or tfvars.json.

</details>

---
### Question 52

If required_providers is omitted but provider blocks exist, modern Terraform:

- A. Still expects provider requirements to be declared in terraform block (Terraform 0.13+ best practice)
- B. Cannot run at all ever
- C. Automatically uses Ansible
- D. Ignores providers

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Terraform 0.13+ requires explicit provider source addresses in required_providers for clarity.

</details>

---
### Question 53

The lock file is updated when:

- A. Running terraform init with provider version changes or -upgrade
- B. Running terraform fmt only
- C. Running terraform version only
- D. Editing README.md

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Init selects provider versions and records checksums in .terraform.lock.hcl.

</details>

---
### Question 54

Which practice supports team-wide consistent Terraform CLI usage?

- A. Documenting required_version and enforcing in CI
- B. Each developer using random CLI versions without checks
- C. Deleting versions.tf
- D. Committing .terraform/ binaries only

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** required_version plus CI checks align CLI versions across teammates.

</details>

---
### Question 55

outputs are defined with:

- A. output "name" { value = ... }
- B. variable "name" { value = ... } only
- C. provider "name" { output = ... }
- D. resource "output" "name" {}

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Output blocks use the output keyword with a name label and value argument.

</details>

---
### Question 56

A trap: terraform.tfvars is required for all projects. Reality:

- A. Variables can use defaults, CLI -var, or other tfvars files; terraform.tfvars is optional
- B. Terraform cannot run without tfvars
- C. tfvars replaces providers.tf
- D. tfvars stores lock checksums

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** terraform.tfvars is auto-loaded if present but not mandatory.

</details>

---
### Question 57

Which items are true about Terraform basics? (Select all that apply.)

- A. HCL is the primary configuration language
- B. .terraform.lock.hcl should be committed
- C. terraform.tfstate should be handled carefully and not committed casually
- D. Provider blocks belong inside resource blocks always
- E. ~> is a pessimistic version constraint

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, C, E**

**Explanation:** HCL, lock file commit, careful state handling, and pessimistic ~> are core basics. Provider blocks are sibling constructs, not nested in resources.

</details>

---
### Question 58

Which command must run before plan/apply in a new working directory?

- A. terraform init
- B. terraform destroy
- C. terraform login only
- D. terraform graph only

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** init downloads providers/modules and prepares the backend before other workflow commands.

</details>

---
### Question 59

Variable declarations use which block type?

- A. variable "name" { ... }
- B. output "name" { ... } only
- C. provider "name" { ... } only
- D. terraform "name" { ... }

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Input variables are declared with variable blocks; outputs and providers use their own block types.

</details>

---
### Question 60

The source argument in required_providers identifies:

- A. The provider's registry address (namespace/name)
- B. The Git branch for terraform.tfstate
- C. The AWS account root email
- D. The local path to terraform.tfvars only

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** source specifies the provider registry location, e.g., hashicorp/aws.

</details>

---
