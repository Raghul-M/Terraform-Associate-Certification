# Understand the Purpose of Terraform (vs Other IaC)

> **Exam Domain:** Understand the Purpose of Terraform (vs Other IaC) | **Weight:** 7-9%
> **Questions:** 60 | **Format:** Multiple choice & multi-select (like Terraform Associate 004)

Covers Terraform's role vs Ansible, CloudFormation, and Pulumi; provider model; multi-cloud advantages; and core value proposition.

**Instructions:** Answer each question, then expand the dropdown to check your answer and explanation.

---

### Question 1

What is Terraform's primary focus compared to Ansible?

- A. Configuration management and ad hoc command execution on existing hosts
- B. Infrastructure provisioning and lifecycle management via declarative config
- C. Windows desktop application deployment only
- D. Real-time log aggregation only

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Terraform focuses on provisioning cloud/network infrastructure; Ansible focuses more on configuration management.

</details>

---
### Question 2

Ansible is generally described as:

- A. A declarative-only cloud provisioning tool with no procedural tasks
- B. An agent-based configuration management tool using procedural playbooks
- C. An AWS-only JSON template engine
- D. A replacement for Git version control

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Ansible commonly uses procedural playbooks and is often agentless (SSH/WinRM), focused on configuring systems.

</details>

---
### Question 3

AWS CloudFormation is limited to:

- A. Any cloud provider through plugins
- B. AWS resources using JSON or YAML templates
- C. Only on-premises VMware
- D. Kubernetes clusters exclusively

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** CloudFormation is AWS-native and uses JSON/YAML templates for AWS stacks.

</details>

---
### Question 4

Pulumi differs from Terraform primarily because it:

- A. Uses only graphical wizards with no code
- B. Lets you define infrastructure using general-purpose programming languages
- C. Cannot manage cloud resources
- D. Requires the AWS console for every change

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Pulumi uses languages like TypeScript, Python, and Go instead of HCL as the primary authoring experience.

</details>

---
### Question 5

A key advantage of Terraform's provider model is:

- A. It locks you into a single vendor permanently
- B. It enables multi-cloud and heterogeneous infrastructure from one workflow
- C. It removes the need for authentication
- D. It only supports HashiCorp-built clouds

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Providers allow Terraform to manage many platforms with a consistent workflow.

</details>

---
### Question 6

Terraform configurations are primarily written in:

- A. CloudFormation YAML only
- B. HashiCorp Configuration Language (HCL)
- C. Ansible inventory INI only
- D. Pulumi Assembly exclusively

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Terraform's native language is HCL, though JSON syntax is also supported.

</details>

---
### Question 7

Which tool is MOST associated with procedural, step-by-step automation on servers?

- A. Terraform
- B. Ansible
- C. CloudFormation
- D. Terraform Cloud exclusively

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Ansible playbooks describe tasks and steps; Terraform declares desired infrastructure state.

</details>

---
### Question 8

CloudFormation templates are typically authored in:

- A. HCL only
- B. JSON or YAML
- C. Go source only
- D. Shell scripts exclusively

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** CloudFormation uses JSON or YAML template formats native to AWS.

</details>

---
### Question 9

Terraform is described as provider-agnostic because:

- A. It ignores all provider APIs
- B. It uses plugins to interact with many vendor APIs through a common workflow
- C. It cannot configure AWS
- D. It only works offline

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Provider plugins abstract vendor APIs while keeping a consistent Terraform workflow.

</details>

---
### Question 10

Which statements comparing Terraform to other IaC tools are TRUE? (Select all that apply.)

- A. Terraform is declarative; Ansible is often procedural
- B. CloudFormation is AWS-only
- C. Pulumi supports real programming languages for infrastructure
- D. Ansible is primarily an infrastructure provisioning tool like Terraform
- E. Terraform uses HCL as its primary configuration language

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, C, E**

**Explanation:** Terraform is declarative provisioning with HCL. Ansible is more config-mgmt/procedural. CloudFormation is AWS-only. Pulumi uses general-purpose languages.

</details>

---
### Question 11

Multi-cloud strategy with Terraform means:

- A. Using one tool with multiple providers to manage resources across different clouds
- B. Running separate uncoordinated consoles only
- C. Terraform automatically picks the cheapest cloud without configuration
- D. Providers are not needed for multiple clouds

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Terraform can manage AWS, Azure, GCP, and others via providers in unified configurations.

</details>

---
### Question 12

Why might a team choose Terraform over CloudFormation?

- A. They need AWS-only templates in YAML
- B. They want a provider-agnostic tool usable across multiple clouds and services
- C. They require a procedural playbook model
- D. They want to avoid any declarative syntax

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Terraform's multi-provider support suits heterogeneous or multi-cloud environments.

</details>

---
### Question 13

Ansible is often agentless, meaning:

- A. It cannot connect to remote hosts
- B. It typically uses SSH or WinRM without installing a permanent agent on targets
- C. It requires a daemon on every server by default
- D. It only runs on the Terraform server

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Ansible commonly connects over SSH/WinRM; this differs from many agent-based config systems.

</details>

---
### Question 14

Terraform vs. Pulumi: both can provision infrastructure, but Terraform traditionally uses:

- A. HCL and a dedicated plan/apply workflow
- B. Only CloudFormation embedded strings
- C. Excel spreadsheets for resource graphs
- D. Manual console operations

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Terraform centers on HCL and its core workflow; Pulumi centers on general-purpose languages.

</details>

---
### Question 15

Infrastructure provisioning focus means Terraform excels at:

- A. Creating VPCs, subnets, load balancers, and databases as declared resources
- B. Installing application packages on hundreds of servers via task lists only
- C. Replacing Git for source control
- D. Monitoring application traces only

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Terraform's sweet spot is cloud/network infrastructure resources, not just OS-level package tasks.

</details>

---
### Question 16

A misconception is that Terraform and Ansible cannot be used together. What is accurate?

- A. They address overlapping but different layers and are often complementary
- B. Using both is forbidden by HashiCorp
- C. Ansible replaces Terraform state
- D. Terraform cannot output values for other tools

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Teams often use Terraform for infrastructure and Ansible (or others) for configuration when needed.

</details>

---
### Question 17

CloudFormation stack operations are tied to:

- A. Any cloud through Terraform providers
- B. AWS APIs and AWS-specific resource types
- C. Only local Docker containers
- D. Kubernetes CRDs exclusively

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** CloudFormation manages AWS stacks via AWS-native resource definitions.

</details>

---
### Question 18

Provider-agnostic in Terraform does NOT mean:

- A. Every provider behaves identically for all features
- B. The same workflow (init, plan, apply) applies across providers
- C. You can install providers from a registry
- D. You can combine multiple providers in one configuration

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Workflow is consistent, but provider capabilities and schemas differ by vendor.

</details>

---
### Question 19

Pulumi's use of programming languages enables:

- A. Avoiding all testing of infrastructure code
- B. Using familiar language constructs like loops, classes, and packages
- C. Eliminating the need for state
- D. Running only in the AWS console

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** General-purpose languages bring familiar abstractions; state and cloud APIs are still required.

</details>

---
### Question 20

Which are advantages of Terraform's multi-cloud approach? (Select all that apply.)

- A. Consistent workflow across providers
- B. Ability to manage heterogeneous environments in one toolchain
- C. Automatic elimination of all cloud outages
- D. Shared practices for plan, review, and apply
- E. Single HCL-based skill set for multiple platforms

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, D, E**

**Explanation:** Multi-cloud Terraform brings workflow consistency and shared practices. It does not eliminate outages or vendor differences.

</details>

---
### Question 21

Terraform is declarative. Ansible playbooks are often described as:

- A. Purely declarative with no task ordering
- B. Procedural sequences of tasks
- C. Only JSON CloudFormation templates
- D. Immutable image builders only

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Ansible tasks run in order; Terraform declares end state and lets the engine plan changes.

</details>

---
### Question 22

Which comparison is FALSE?

- A. CloudFormation is limited to AWS
- B. Terraform can use providers for many vendors
- C. Ansible is primarily identical to Terraform in purpose
- D. Pulumi supports multiple programming languages

<details>
<summary>View Answer</summary>

**Correct Answer: C**

**Explanation:** Ansible and Terraform overlap at the edges but have different primary focuses.

</details>

---
### Question 23

When evaluating IaC tools, Terraform's HCL is designed to be:

- A. Human-readable and tailored to infrastructure structures
- B. Identical to CloudFormation intrinsic functions only
- C. A general-purpose application language only
- D. Unusable with variables or modules

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** HCL is a DSL for infrastructure, balancing readability with IaC constructs.

</details>

---
### Question 24

A team standardized on AWS only and wants native service integration with minimal abstraction. They might consider:

- A. CloudFormation or Terraform with the AWS provider
- B. Terraform only for desktop software
- C. Ansible only for VPC creation with no cloud modules
- D. Git alone without IaC

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Both CloudFormation and Terraform can manage AWS; choice depends on ecosystem and multi-cloud needs.

</details>

---
### Question 25

Terraform's provider ecosystem is distributed via:

- A. The Terraform Registry and provider plugins
- B. Only embedded AWS console links
- C. Email attachments from vendors
- D. Manual kernel modules

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Providers are published and consumed through the registry and plugin mechanism.

</details>

---
### Question 26

Why is Terraform NOT a replacement for Ansible in all cases?

- A. Terraform cannot declare any resources
- B. Terraform does not focus on detailed OS-level configuration and ad hoc task orchestration
- C. Ansible cannot touch Linux servers
- D. Terraform requires agents on every host

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** OS package config, user management, and ad hoc tasks are Ansible's strength more than Terraform's.

</details>

---
### Question 27

CloudFormation and Terraform both:

- A. Can manage AWS infrastructure with declarative templates/configuration
- B. Only support imperative bash
- C. Require Pulumi to function
- D. Are limited to a single resource per stack

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Both support declarative AWS infrastructure, though syntax and ecosystems differ.

</details>

---
### Question 28

Pulumi still tracks infrastructure state similar to Terraform because:

- A. Cloud APIs require tracking what was provisioned for updates and destroys
- B. Programming languages eliminate persistence needs
- C. AWS forbids state files
- D. State is only needed for Ansible

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Any IaC tool performing lifecycle management needs state or equivalent tracking.

</details>

---
### Question 29

Multi-cloud does NOT automatically mean:

- A. Every workload runs on every cloud simultaneously
- B. One team can use Terraform providers for different vendors
- C. Workflows can be standardized with shared tooling
- D. Vendor lock-in at the tool level is reduced

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Multi-cloud capability means optionality and heterogeneous management, not mandatory duplication everywhere.

</details>

---
### Question 30

Which tools are AWS-only or primarily AWS-native? (Select all that apply.)

- A. AWS CloudFormation
- B. Terraform with hashicorp/aws provider
- C. AWS CDK (generates CloudFormation)
- D. Terraform with hashicorp/azurerm provider
- E. Pulumi AWS provider

<details>
<summary>View Answer</summary>

**Correct Answers: A, C**

**Explanation:** CloudFormation and CDK (targeting CloudFormation) are AWS-native. Terraform and Pulumi can target AWS but are not AWS-only platforms.

</details>

---
### Question 31

Terraform's infrastructure provisioning focus is demonstrated by:

- A. Resource blocks like aws_instance and azurerm_resource_group
- B. Only local file permission tasks
- C. Replacing CI/CD pipelines entirely
- D. Eliminating cloud APIs

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Terraform resource types map to cloud/network infrastructure objects.

</details>

---
### Question 32

Ansible's procedural nature means:

- A. Order of tasks can matter for the final system state
- B. It cannot install packages
- C. It only declares VPC CIDR blocks
- D. It never uses variables

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Task order and imperative steps are central to many Ansible playbooks.

</details>

---
### Question 33

Choosing Pulumi over Terraform might be driven by:

- A. Desire to use TypeScript/Python with existing language tooling
- B. Requirement to use only JSON CloudFormation
- C. Need to avoid all state management
- D. Mandate to use only console ClickOps

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Language familiarity and ecosystem integration are common Pulumi adoption reasons.

</details>

---
### Question 34

Provider-agnostic workflows still require:

- A. Ignoring provider documentation
- B. Understanding each provider's resource types and authentication
- C. Using only one resource in the entire project
- D. Disabling terraform init

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Each provider has unique schemas, auth, and behaviors despite a shared Terraform workflow.

</details>

---
### Question 35

Terraform compared to CloudFormation for a multi-cloud company:

- A. Terraform aligns better with managing multiple vendors from one tool
- B. CloudFormation manages Azure natively
- C. Terraform cannot use JSON syntax
- D. CloudFormation is provider-agnostic across all clouds

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** CloudFormation is AWS-specific; Terraform supports many providers.

</details>

---
### Question 36

Declarative HCL in Terraform means users write:

- A. resource and data blocks describing desired infrastructure
- B. Only ordered shell commands
- C. CloudFormation transforms exclusively
- D. Unstructured plain text with no schema

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** HCL blocks declare resources, variables, outputs, and provider settings.

</details>

---
### Question 37

A common exam trap: Terraform and Ansible are competitors only. Better answer:

- A. They often complement each other for infrastructure vs. configuration layers
- B. They cannot be used in the same organization
- C. Ansible stores Terraform state by default
- D. Terraform runs Ansible playbooks automatically without configuration

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Many organizations use both for different layers of the stack.

</details>

---
### Question 38

CloudFormation intrinsic functions and Terraform expressions both:

- A. Help compute values within declarative templates/configuration
- B. Replace the need for providers
- C. Eliminate variables
- D. Are identical syntax

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Both support dynamic values, but syntax and capabilities differ.

</details>

---
### Question 39

Terraform's value in heterogeneous environments is:

- A. One plan/apply workflow across diverse providers
- B. Automatic translation of Azure resources into AWS resources
- C. Removal of all provider-specific attributes
- D. Exclusive focus on on-premises metal

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Consistent workflow is the benefit; resources remain provider-specific.

</details>

---
### Question 40

Which describe Ansible accurately? (Select all that apply.)

- A. Configuration management focus
- B. Often uses procedural playbooks
- C. Typically agentless over SSH/WinRM
- D. AWS-only declarative stack service
- E. Primarily the same as Terraform's core purpose

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, C**

**Explanation:** Ansible is config-mgmt, procedural/agentless. It is not AWS-only stack service nor Terraform's primary provisioning focus.

</details>

---
### Question 41

Pulumi and Terraform both support:

- A. Infrastructure as code with plan-like previews (depending on setup) and state tracking
- B. Only manual console operations
- C. Exclusively Ansible playbook syntax
- D. Managing infrastructure without any plugins or providers

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Both are IaC platforms with lifecycle management, though interfaces differ.

</details>

---
### Question 42

Why might Terraform be preferred for network infrastructure baselines?

- A. Declarative modeling of VPCs, subnets, routing, and security policies
- B. It cannot model networking resources
- C. It only configures /etc/hosts files
- D. It replaces DNS globally

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Terraform resource types commonly model cloud networking primitives.

</details>

---
### Question 43

CloudFormation stack sets are an AWS feature for:

- A. Deploying stacks across multiple accounts/regions
- B. Replacing Terraform state backends
- C. Running Ansible playbooks
- D. Managing Azure subscriptions

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** StackSets extend CloudFormation across AWS org accounts/regions; it's AWS-specific.

</details>

---
### Question 44

Terraform provider plugins are responsible for:

- A. Translating Terraform resource changes into vendor API calls
- B. Formatting laptop filesystems only
- C. Compiling HCL to Python bytecode only
- D. Storing Git commit messages

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Providers implement CRUD operations against external APIs.

</details>

---
### Question 45

Infrastructure provisioning vs. configuration management: which pairing is MOST accurate?

- A. Terraform — provisioning; Ansible — configuration
- B. Terraform — configuration only; Ansible — provisioning only
- C. Both only do log analysis
- D. Neither interacts with APIs

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** This layering distinction is a core exam comparison point.

</details>

---
### Question 46

Using real programming languages (Pulumi) trades off:

- A. All need for testing
- B. HCL simplicity for language flexibility and abstractions
- C. Any ability to manage cloud resources
- D. Provider authentication requirements

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Languages add flexibility; teams must still govern complexity and state.

</details>

---
### Question 47

Terraform being cloud-agnostic at the tool level means:

- A. You can target multiple platforms without switching to entirely different IaC products
- B. All clouds share identical resource names
- C. Pricing is identical across clouds
- D. You never need credentials

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Tooling consistency does not imply identical cloud capabilities or pricing.

</details>

---
### Question 48

A FALSE statement about CloudFormation is:

- A. It uses templates to declare AWS infrastructure
- B. It can manage Azure Resource Groups natively
- C. It integrates with AWS services
- D. Templates may be JSON or YAML

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** CloudFormation does not natively manage Azure resources.

</details>

---
### Question 49

Which are reasons teams adopt Terraform for multi-cloud? (Select all that apply.)

- A. Unified workflow (init, plan, apply)
- B. Large provider ecosystem
- C. Identical resource schemas across all clouds
- D. Shared module patterns with variables
- E. Reduced need to learn every vendor's native IaC DSL

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, D, E**

**Explanation:** Workflow, ecosystem, modules, and skill reuse are benefits. Resource schemas differ by provider.

</details>

---
### Question 50

Ansible Galaxy primarily provides:

- A. Reusable Ansible roles and collections
- B. Terraform provider binaries only
- C. CloudFormation stack sets
- D. Pulumi state encryption keys

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Galaxy is Ansible's content hub; Terraform uses the Terraform Registry for modules/providers.

</details>

---
### Question 51

Terraform HCL vs. Pulumi TypeScript: both aim to:

- A. Describe and manage infrastructure programmatically
- B. Replace cloud provider SLAs
- C. Eliminate IAM
- D. Avoid all code review

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Both are IaC authoring approaches with different language choices.

</details>

---
### Question 52

Provider-agnostic is sometimes misunderstood as 'no vendor differences.' Reality:

- A. Workflow is shared; resource attributes and limits remain vendor-specific
- B. AWS and Azure use identical resource types
- C. Terraform ignores provider schemas
- D. Providers are optional for all resources

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Terraform unifies process, not identical cloud APIs.

</details>

---
### Question 53

For strictly AWS-native teams allergic to third-party tools, a native option is:

- A. CloudFormation or CDK
- B. Terraform only for desktop apps
- C. Ansible only without cloud modules
- D. GitOps without any IaC

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** CloudFormation/CDK are AWS-native IaC paths.

</details>

---
### Question 54

Terraform's declarative model contrasts with Ansible ad hoc commands because:

- A. Ad hoc commands are one-off imperative actions without persistent desired-state files
- B. Terraform cannot run twice
- C. Ansible cannot automate anything
- D. Terraform only works on localhost

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Ad hoc Ansible is imperative and ephemeral compared to declared Terraform configuration.

</details>

---
### Question 55

When comparing IaC tools, 'infrastructure provisioning focus' for Terraform excludes:

- A. Primary emphasis on long-running OS package tuning as its core design center
- B. Creating load balancers
- C. Managing DNS records via providers
- D. Defining storage buckets

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** OS-level tuning is more Ansible's center; Terraform centers on cloud infrastructure resources.

</details>

---
### Question 56

Pulumi can target multiple clouds, similar to Terraform, by using:

- A. Cloud-specific providers/SDKs within programs
- B. Eliminating all credentials
- C. Only CloudFormation templates
- D. Manual console-only workflows

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Pulumi uses provider packages for AWS, Azure, GCP, and others.

</details>

---
### Question 57

Terraform vs. CloudFormation: both require:

- A. Understanding of the underlying cloud resources being modeled
- B. Identical template languages
- C. Ansible inventory files
- D. No authentication to cloud APIs

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Both need cloud knowledge; languages and ecosystems differ.

</details>

---
### Question 58

Which statements about Terraform's purpose are correct? (Select all that apply.)

- A. Declarative infrastructure provisioning
- B. Provider-based multi-cloud support
- C. Primary configuration management replacement for all OS tasks
- D. Uses HCL as the main language
- E. Competes with CloudFormation on AWS while supporting other vendors

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, D, E**

**Explanation:** Terraform is declarative, multi-provider, HCL-based, and overlaps with CloudFormation on AWS while going broader. It is not primarily an OS config-mgmt tool.

</details>

---
### Question 59

Which tool would you MOST likely use to run ordered package installation tasks on existing VMs?

- A. Terraform with only resource blocks
- B. Ansible playbooks
- C. CloudFormation stack policies
- D. terraform.tfvars

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Ansible excels at ordered configuration tasks on existing hosts; Terraform focuses on provisioning infrastructure objects.

</details>

---
### Question 60

A team wants one IaC tool for AWS, Azure, and Kubernetes resources with the same workflow. Best fit:

- A. AWS CloudFormation only
- B. Terraform with multiple providers
- C. Console ClickOps per cloud
- D. Spreadsheets for each resource

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Terraform's provider model supports heterogeneous platforms under one init/plan/apply workflow.

</details>

---
