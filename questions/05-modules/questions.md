# Interact with Terraform Modules

> **Exam Domain:** Interact with Terraform Modules | **Weight:** 8-10%
> **Questions:** 60 | **Format:** Multiple choice & multi-select (like Terraform Associate 004)

Covers root vs child modules, sources, inputs/outputs, versioning, registry conventions, and module best practices.

**Instructions:** Answer each question, then expand the dropdown to check your answer and explanation.

---

### Question 1

What is the root module in a Terraform project?

- A. The top-level published module on the Terraform Registry
- B. The working directory where you run Terraform commands
- C. Any module that defines provider configurations
- D. The first module block alphabetically in main.tf

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** The root module is the configuration in the directory where you execute `terraform`—it may call child modules.

</details>

---
### Question 2

What is a child module?

- A. A module that cannot define variables
- B. A module called from another module via a `module` block
- C. A module stored only on GitHub
- D. A deprecated local module path

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Child modules are invoked by `module` blocks in the root or another module. They encapsulate reusable infrastructure.

</details>

---
### Question 3

How do you reference an output named `vpc_id` from a module block labeled `network`?

- A. output.network.vpc_id
- B. module.network.vpc_id
- C. var.network.vpc_id
- D. data.network.vpc_id

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Module outputs use `module.<module_name>.<output_name>`. The module label comes from the `module` block's label.

</details>

---
### Question 4

Which `source` value references a module in `./modules/vpc` relative to the caller?

- A. modules/vpc
- B. ./modules/vpc
- C. local://modules/vpc
- D. path.module/vpc

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Local modules use filesystem paths like `./modules/vpc` or `../shared/vpc`. `path.module` is used inside a module, not as a source prefix.

</details>

---
### Question 5

What is the registry source format for namespace `terraform-aws-modules`, name `vpc`, provider `aws`?

- A. hashicorp/terraform-aws-modules/vpc
- B. terraform-aws-modules/vpc/aws
- C. registry.terraform.io/vpc/aws
- D. aws/terraform-aws-modules/vpc

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Public registry modules use `namespace/name/provider` (e.g., `terraform-aws-modules/vpc/aws`).

</details>

---
### Question 6

Which module source URL uses the Git subdirectory syntax?

- A. github.com/org/repo/modules/vpc
- B. github.com/org/repo//modules/vpc
- C. git::github.com/org/repo:modules/vpc
- D. s3::github.com/org/repo/modules/vpc

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Double slash `//` separates the repo URL from the subdirectory path within the repository.

</details>

---
### Question 7

How do you pin a public registry module to version `5.1.0`?

- A. Add version = "5.1.0" inside the module block
- B. Set required_version in the child module only
- C. Use terraform init -version 5.1.0
- D. Pinning is automatic from the registry

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Registry modules support a `version` argument in the `module` block. Always pin versions for reproducibility.

</details>

---
### Question 8

Which are valid Terraform module sources? Select all that apply.

- A. ./modules/vpc
- B. terraform-aws-modules/vpc/aws
- C. github.com/hashicorp/consul//modules/consul-aws
- D. git::https://example.com/vpc.git

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, C, D**

**Explanation:** Modules can be sourced from local paths, the public registry, GitHub/Git URLs, and S3 buckets. All listed forms are valid.

</details>

---
### Question 9

What does `terraform init` do regarding modules?

- A. Nothing; modules are loaded only at apply time
- B. Downloads and installs modules declared in module blocks
- C. Publishes modules to the registry
- D. Compiles modules into provider plugins

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `terraform init` installs providers, initializes the backend, and downloads modules to `.terraform/modules`.

</details>

---
### Question 10

How does `terraform get` differ from `terraform init` for modules?

- A. get also installs providers and backends
- B. get downloads or updates modules without full init side effects
- C. get only works with local modules
- D. get is deprecated and removed in Terraform 1.0

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `terraform get` (or `terraform get -update`) refreshes modules. `init` performs full initialization including providers and backend.

</details>

---
### Question 11

Do child modules automatically inherit provider configurations from the root module?

- A. Yes, all providers pass through implicitly
- B. No, providers must be passed explicitly or configured in the child
- C. Only for the default provider
- D. Only when using registry modules

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** A common exam trap: child modules do not inherit provider configs. Use `providers` argument or `configuration_aliases`.

</details>

---
### Question 12

Can the root module access a child module's internal local value without an output?

- A. Yes, via module.<name>.local.<value>
- B. No, only declared outputs are accessible outside the module
- C. Yes, if the variable has no default
- D. Only in terraform console

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Module internals are encapsulated. Expose values through `output` blocks to use them outside the module.

</details>

---
### Question 13

What naming convention do published registry modules typically follow?

- A. provider-terraform-NAME
- B. terraform-PROVIDER-NAME
- C. NAME-terraform-provider
- D. hashicorp-NAME-provider

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Registry convention is `terraform-<PROVIDER>-<NAME>` (e.g., `terraform-aws-vpc`).

</details>

---
### Question 14

Where are downloaded modules cached locally?

- A. .terraform/modules/
- B. modules/.cache/
- C. terraform.tfstate.d/modules/
- D. .terraform/providers/

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Module sources are stored under `.terraform/modules/`. Provider plugins live in `.terraform/providers/`.

</details>

---
### Question 15

Can you use the `version` argument with a GitHub module source?

- A. Yes, always
- B. No, version pinning applies to registry modules; use Git refs (ref=) for Git sources
- C. Only with S3 sources
- D. Only in Terraform Enterprise

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** The `version` argument is for registry modules. Git sources use `?ref=<tag>` in the URL for pinning.

</details>

---
### Question 16

Which statements about module inputs and outputs are true? Select all that apply.

- A. Input variables are set via arguments in the module block
- B. Outputs must be declared to be referenced outside the module
- C. All variables.tf entries are automatically outputs
- D. module.<name>.<output> references an output value

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, D**

**Explanation:** Inputs are passed as module block arguments. Outputs must be explicitly declared. Variables are not auto-exposed as outputs.

</details>

---
### Question 17

What happens if you change a module's `source` URL?

- A. Nothing until apply
- B. terraform init must be re-run to install the new source
- C. State is automatically migrated
- D. The old module remains cached permanently

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Changing `source` (or version) requires re-initialization so Terraform downloads the correct module package.

</details>

---
### Question 18

Can a module call another module?

- A. No, nesting is limited to one level
- B. Yes, modules can contain module blocks (nested modules)
- C. Only root modules can nest
- D. Only registry modules can nest

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Modules can nest arbitrarily. A child module may invoke its own child modules.

</details>

---
### Question 19

What is `path.module` inside a child module?

- A. The root module directory
- B. The filesystem path of the current module
- C. The registry namespace
- D. The remote backend path

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `path.module` is the path to the module whose configuration is being evaluated—useful for referencing files within the module.

</details>

---
### Question 20

Which argument maps providers from the parent to a child module?

- A. provider
- B. providers
- C. alias
- D. required_providers only

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** The `providers` meta-argument passes provider configurations: `providers = { aws = aws.us }`.

</details>

---
### Question 21

For an S3 module source, which prefix is correct?

- A. s3://bucket/key
- B. s3::https://s3.amazonaws.com/bucket/key
- C. aws-s3://bucket/key
- D. module-s3://bucket/key

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** S3 module sources use the `s3::` prefix with an HTTPS URL to the object (often a zip archive).

</details>

---
### Question 22

Which are true about `terraform init` vs `terraform get`? Select all that apply.

- A. init installs providers
- B. get can update modules with -update
- C. init is required after adding a new module block
- D. get configures the remote backend

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, C**

**Explanation:** init handles providers, backend, and modules. `terraform get -update` refreshes modules. Backend setup is part of init, not get.

</details>

---
### Question 23

If a module block omits a required input variable, when is the error detected?

- A. Only at apply time in the cloud API
- B. During plan or validate when Terraform evaluates the module call
- C. Never, defaults are always applied
- D. Only during terraform init

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Missing required module arguments surface during validation/plan when Terraform checks the module call against variable definitions.

</details>

---
### Question 24

Can two module blocks use the same `source` with different labels?

- A. No, source must be unique per configuration
- B. Yes, different labels create separate module instances
- C. Only if versions differ
- D. Only for local modules

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** The module block label distinguishes instances. Same source can be used multiple times with different inputs.

</details>

---
### Question 25

What file in a module typically declares input variables?

- A. outputs.tf
- B. variables.tf
- C. providers.tf only
- D. terraform.tfstate

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Convention places `variable` blocks in `variables.tf` (or any .tf file). Outputs go in `outputs.tf`.

</details>

---
### Question 26

Must module blocks include a `source` argument?

- A. No, source is optional for local modules
- B. Yes, every module block requires source
- C. Only for registry modules
- D. Only when using count

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `source` is mandatory—it tells Terraform where to load the module from.

</details>

---
### Question 27

What is a private module registry primarily used for?

- A. Storing terraform.tfstate files
- B. Hosting organization-internal modules with versioning and access control
- C. Replacing the need for variables
- D. Running terraform apply in the cloud only

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Private registries (e.g., HCP Terraform) host internal modules with the same `namespace/name/provider` pattern as the public registry.

</details>

---
### Question 28

Which provider inheritance statements are correct? Select all that apply.

- A. Child modules do not automatically inherit parent providers
- B. The providers meta-argument can pass explicit provider configs
- C. configuration_aliases enable multiple provider configs in a module
- D. Registry modules always use the root AWS credentials automatically

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, C**

**Explanation:** Providers must be explicitly passed or declared in modules. Registry modules do not magically inherit credentials.

</details>

---
### Question 29

What does the module block label `vpc` in `module "vpc"` define?

- A. The registry namespace
- B. The local name used to reference this module instance
- C. The cloud resource name tag
- D. The provider type

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** The string in quotes is the module instance name used in references like `module.vpc.vpc_id`.

</details>

---
### Question 30

Can you reference `module.foo.bar` if `bar` is an input variable inside module foo?

- A. Yes, all variables are exported
- B. No, only output values are accessible via module.foo
- C. Only with terraform console
- D. Only if bar has a default

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Input variables are not accessible outside the module. Only outputs appear on the module namespace.

</details>

---
### Question 31

When using a registry module, where is the `version` constraint evaluated?

- A. Against available versions in the registry during init
- B. Only during terraform apply in the cloud
- C. By the provider plugin
- D. By terraform fmt

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** During init, Terraform resolves the module version constraint and downloads the matching release.

</details>

---
### Question 32

What is the effect of `terraform init -upgrade` on modules?

- A. It ignores modules entirely
- B. It may upgrade modules to newer versions allowed by version constraints
- C. It deletes all module outputs
- D. It publishes modules to the registry

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `-upgrade` re-resolves provider and module versions to the newest permitted by constraints.

</details>

---
### Question 33

Which Git source form includes an explicit ref query parameter?

- A. git::https://example.com/repo.git?ref=v1.2.0
- B. git::https://example.com/repo.git//ref=v1.2.0
- C. github.com/example/repo/ref/v1.2.0
- D. git+ref://example.com/repo

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Pin Git module sources with `?ref=<tag|branch|commit>` appended to the URL.

</details>

---
### Question 34

Can modules contain `resource` blocks?

- A. No, only the root module can
- B. Yes, modules define resources like any configuration
- C. Only data sources
- D. Only with HCP Terraform

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Modules are standard Terraform configuration containing resources, data sources, variables, outputs, etc.

</details>

---
### Question 35

Which module source examples are syntactically valid? Select all that apply.

- A. source = "./modules/network"
- B. source = "terraform-aws-modules/eks/aws"
- C. source = "git::ssh://git@example.com/vpc.git"
- D. source = "module.vpc"

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, C**

**Explanation:** `module.vpc` is a reference syntax, not a valid source path. Local paths, registry coordinates, and Git URLs are valid sources.

</details>

---
### Question 36

Why should you pin module versions in production?

- A. To speed up terraform plan
- B. To ensure reproducible deployments and avoid surprise upstream changes
- C. Because unpinned modules fail terraform validate
- D. To enable force-unlock

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Unpinned or loosely constrained versions can pull breaking changes on the next init, causing unexpected infrastructure drift.

</details>

---
### Question 37

What is returned if you reference a nonexistent module output?

- A. null silently
- B. A Terraform error during plan or apply
- C. The variable default
- D. An empty string

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Referencing `module.foo.nonexistent` fails validation/plan because the output is not declared in the child module.

</details>

---
### Question 38

Does the root module have a `module` block calling itself?

- A. Yes, required for initialization
- B. No, the root module is implicit and not declared with a module block
- C. Only in HCP Terraform
- D. Only when using count

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** The root module is the working directory configuration. Only child modules appear in `module` blocks.

</details>

---
### Question 39

Can module outputs be used in `terraform output` at the root?

- A. Only if re-exported through a root output block
- B. Automatically, all module outputs appear at root
- C. Never
- D. Only for registry modules

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Root `output` blocks must explicitly expose values. Module outputs are not automatically promoted to root outputs.

</details>

---
### Question 40

What directory is created when modules are downloaded during init?

- A. .terraform/modules/<module_key>/
- B. modules/downloaded/
- C. terraform-modules/
- D. .modules/cache/

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Terraform stores extracted modules under `.terraform/modules/` with internal keys mapping to module calls.

</details>

---
### Question 41

When passing providers to a child module, what happens if a required provider is not passed?

- A. Terraform uses null provider
- B. Terraform may error because the child module's provider configuration is incomplete
- C. The root provider is always used automatically
- D. Only warnings are shown

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Without explicit inheritance or in-module provider blocks, missing provider mappings cause configuration errors.

</details>

---
### Question 42

Which is true about the Terraform Registry module namespace?

- A. It must always be `hashicorp`
- B. It is the organization or user publishing the module (e.g., terraform-aws-modules)
- C. It matches the cloud provider region
- D. It is the module version number

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** The namespace identifies the publisher. `hashicorp` is one namespace among many.

</details>

---
### Question 43

Which practices follow module best practices for the exam? Select all that apply.

- A. Pin registry module versions
- B. Expose only necessary values via outputs
- C. Rely on implicit provider inheritance
- D. Use meaningful module block labels

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, D**

**Explanation:** Pin versions, minimize exposed outputs, and use clear labels. Implicit provider inheritance is incorrect—pass providers explicitly.

</details>

---
### Question 44

Can `terraform get` install providers?

- A. Yes, same as init
- B. No, it focuses on module installation/update
- C. Only AWS provider
- D. Only with -upgrade

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Provider installation is `terraform init`'s responsibility. `get` is module-oriented.

</details>

---
### Question 45

What metadata file locks module and provider versions for consistent runs?

- A. .terraform.lock.hcl
- B. terraform.tfvars
- C. modules.lock
- D. versions.tf only

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** `.terraform.lock.hcl` records exact provider (and module where applicable) versions. Commit it to version control.

</details>

---
### Question 46

In `module "app" { source = "..." }`, is `app` the module name on the registry?

- A. Yes
- B. No, it is the local instance name; registry name is in source
- C. It is the provider name
- D. It is the state file name

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** The block label is your chosen instance name. Registry identity comes from the `source` string.

</details>

---
### Question 47

Are module input variables automatically available as environment variables?

- A. Yes, TF_VAR_ prefix applies to module inputs globally
- B. No, module inputs are set only via the module block unless using TF_VAR for root variables
- C. Only in HCP Terraform
- D. Only for string variables

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** TF_VAR_ applies to root module variables. Child module inputs are passed explicitly in the module block.

</details>

---
### Question 48

What happens when you remove a module block from configuration?

- A. Nothing
- B. Next plan proposes destroying resources that module managed (unless moved/removed from state)
- C. terraform init fails permanently
- D. Module files in .terraform/modules are deleted from disk immediately

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Removing a module call means Terraform no longer manages those resources—plan shows destroys unless you use state operations.

</details>

---
### Question 49

Can a single configuration use both local and registry module sources?

- A. No, all modules must share one source type
- B. Yes, each module block has its own source
- C. Only in separate workspaces
- D. Only with terraform cloud

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Different `module` blocks can mix local paths, registry, Git, and S3 sources freely.

</details>

---
### Question 50

What is the third component in `namespace/name/provider` registry coordinates?

- A. The Terraform version
- B. The implied provider for the module (e.g., aws)
- C. The AWS region
- D. The module output name

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** The third segment is the provider type the module targets (e.g., `aws`, `google`, `azurerm`).

</details>

---
### Question 51

Why use modules instead of copying .tf files?

- A. Modules run faster than raw resources
- B. Modules enable reuse, encapsulation, and consistent interfaces via inputs/outputs
- C. Modules do not use state
- D. Modules replace providers

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Modules package infrastructure patterns for reuse and maintain clear contracts through variables and outputs.

</details>

---
### Question 52

After cloning a repo with modules, which command must you run first?

- A. terraform apply
- B. terraform init
- C. terraform destroy
- D. terraform graph

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Init downloads modules and providers before plan/apply can succeed.

</details>

---
### Question 53

Can module `version` use constraint operators like `~> 5.0`?

- A. No, only exact versions
- B. Yes, version supports constraint syntax like providers
- C. Only in required_providers
- D. Only for local modules

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Module version arguments accept version constraints (e.g., `~> 5.0`, `>= 4.0, < 6.0`) for registry modules.

</details>

---
### Question 54

What does `terraform init -reconfigure` do regarding modules?

- A. Skips module download entirely
- B. Reinitializes backend without migration prompt; still processes module installation per init
- C. Deletes all module outputs from state
- D. Publishes modules to a private registry

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `-reconfigure` ignores backend migration and reinitializes. Modules are still installed during init as usual.

</details>

---
### Question 55

Can a module expose sensitive values through outputs?

- A. No, outputs cannot be sensitive
- B. Yes, using `sensitive = true` on the output block
- C. Only root modules can mark sensitivity
- D. Sensitivity is automatic for all passwords

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Module outputs support `sensitive = true`, redacting values from CLI output while still being usable in configuration.

</details>

---
### Question 56

What is the `count` meta-argument used for on a module block?

- A. Counting resources in state only
- B. Creating multiple instances of the same module from one block
- C. Pinning module versions
- D. Replacing terraform.workspace

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `count` (or `for_each`) on a module block creates multiple module instances, referenced as `module.name[0]`, etc.

</details>

---
### Question 57

How do you reference an output from a module instance created with `count`?

- A. module.vpc.output_name only
- B. module.vpc[0].output_name
- C. count.module.vpc.output_name
- D. module.output_name[0]

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Indexed module instances use bracket notation: `module.<name>[<index>].<output>`.

</details>

---
### Question 58

Does `terraform get -update` reinstall providers?

- A. Yes, same as init -upgrade
- B. No, it updates module packages without full init
- C. It only updates .terraform.lock.hcl
- D. It removes the backend configuration

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** `get -update` refreshes modules to match sources/constraints; provider management remains init's job.

</details>

---
### Question 59

When a root module passes `source = "./modules/app"`, where is that path resolved from?

- A. The child module's directory
- B. The directory containing the module block (caller), typically the root
- C. The Terraform installation directory
- D. The remote backend bucket root

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Relative local paths in `source` resolve from the calling module's directory, not from the child module.

</details>

---
### Question 60

What happens if two module blocks use the same label name?

- A. Terraform merges them
- B. Terraform reports a duplicate module name error
- C. The second overrides the first silently
- D. Only the first is downloaded

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Module block labels must be unique within a module. Duplicate labels cause a configuration error.

</details>

---
