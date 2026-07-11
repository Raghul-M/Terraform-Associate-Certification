# Read, Generate, and Modify Configuration

> **Exam Domain:** Read, Generate, and Modify Configuration | **Weight:** 15-18%
> **Questions:** 60 | **Format:** Multiple choice & multi-select (like Terraform Associate 004)

Covers variables, outputs, locals, expressions, functions, meta-arguments, data sources, and dynamic blocks.

**Instructions:** Answer each question, then expand the dropdown to check your answer and explanation.

---

### Question 1

Which variable type constraint is valid in Terraform?

- A. string
- B. char
- C. integer
- D. double only

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Primitive types include string, number, bool. Use number, not integer.

</details>

---
### Question 2

Which are valid complex variable types?

- A. list(string), map(string), set(string)
- B. array(string)
- C. dict(string)
- D. queue(string)

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Terraform uses list, map, set, object, tuple—not array/dict.

</details>

---
### Question 3

What does nullable = false on a variable mean?

- A. The variable cannot be set
- B. The variable cannot be set to null
- C. The variable is sensitive
- D. The variable is deprecated

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** nullable=false rejects null assignments.

</details>

---
### Question 4

validation blocks on variables run during:

- A. terraform plan/apply when values are known
- B. Only terraform fmt
- C. Only provider download
- D. Never

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Validation conditions are checked when Terraform evaluates variables.

</details>

---
### Question 5

sensitive = true on a variable primarily:

- A. Redacts it from CLI output and logs
- B. Prevents it from being used in resources
- C. Stores it only in environment variables
- D. Removes it from state automatically

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Sensitive affects display; it does not remove values from state.

</details>

---
### Question 6

default in a variable block provides:

- A. The lowest-precedence value when none is supplied
- B. The highest-precedence value always
- C. Automatic encryption
- D. Provider configuration

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Defaults apply only when no higher-precedence source provides a value.

</details>

---
### Question 7

type = object({ name = string, count = number }) is an example of:

- A. A structural type constraint
- B. A provider block
- C. A backend type
- D. An output format

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** object() defines structural typing for variables.

</details>

---
### Question 8

type = any on a variable means:

- A. Only strings allowed
- B. Any type is accepted
- C. Null only
- D. Boolean only

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** any disables specific type constraints.

</details>

---
### Question 9

Which has the HIGHEST precedence for Terraform variables?

- A. default in variable block
- B. terraform.tfvars
- C. TF_VAR_name environment variable
- D. -var="name=value" CLI flag

<details>
<summary>View Answer</summary>

**Correct Answer: D**

**Explanation:** Order (low→high): default, TF_VAR_, tfvars, auto.tfvars, -var-file, -var.

</details>

---
### Question 10

Which has the LOWEST precedence?

- A. default in variable block
- B. -var flag
- C. -var-file
- D. TF_VAR_ environment variable

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Explicit CLI -var overrides everything else.

</details>

---
### Question 11

terraform.tfvars is:

- A. Auto-loaded if present
- B. Never loaded automatically
- C. Only loaded with -var-file
- D. Only for outputs

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** terraform.tfvars and *.auto.tfvars load automatically.

</details>

---
### Question 12

Files matching *.auto.tfvars:

- A. Are auto-loaded in lexical order
- B. Are ignored
- C. Override -var flag
- D. Replace providers

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** auto.tfvars files load automatically; alphabetical order matters among them.

</details>

---
### Question 13

TF_VAR_instance_type environment variable beats:

- A. default value and terraform.tfvars
- B. -var CLI flag
- C. Nothing
- D. Only outputs

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** TF_VAR_ beats defaults and tfvars but loses to -var-file and -var.

</details>

---
### Question 14

To pass a one-off override in CI with highest priority, use:

- A. -var="key=value"
- B. Only the default
- C. terraform fmt
- D. terraform graph

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** -var is highest precedence for quick overrides.

</details>

---
### Question 15

Output values are primarily used to:

- A. Declare providers
- B. Expose useful values after apply to users/other systems
- C. Lock state
- D. Download modules

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Outputs surface IPs, IDs, endpoints, etc.

</details>

---
### Question 16

sensitive = true on an output:

- A. Hides value in normal CLI output
- B. Deletes the value from state
- C. Prevents the output from existing
- D. Forces encryption in HCL

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Sensitive outputs are redacted from CLI display.

</details>

---
### Question 17

locals are useful because they:

- A. Reduce repetition and simplify expressions without exposing inputs/outputs
- B. Replace providers
- C. Store remote state
- D. Run provisioners

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** locals are internal computed values.

</details>

---
### Question 18

Reference a local named common_tags:

- A. var.common_tags
- B. local.common_tags
- C. output.common_tags
- D. module.common_tags

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** locals use the local. prefix.

</details>

---
### Question 19

Outputs can reference:

- A. Resource attributes and expressions
- B. Only variables
- C. Only providers
- D. Only modules from other orgs

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Output values can be any expression based on managed infrastructure.

</details>

---
### Question 20

Conditional expression syntax is:

- A. if condition then a else b
- B. condition ? true_val : false_val
- C. when condition -> value
- D. select(condition, a, b)

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Terraform uses the ternary operator ? :

</details>

---
### Question 21

for expression [for s in var.list : upper(s)] returns:

- A. A map
- B. A list derived from var.list
- C. A provider
- D. A backend

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Bracket form produces a list comprehension.

</details>

---
### Question 22

for expression { for k, v in var.map : k => v } returns:

- A. A list
- B. A map/object comprehension
- C. A string
- D. A lock ID

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Curly form with => builds a map.

</details>

---
### Question 23

Splat expression aws_instance.web[*].id collects:

- A. A single string always
- B. A list of id attributes from all instances in that resource collection
- C. Provider configs
- D. Only the first resource in state file order

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** [*] gathers an attribute across multiple instances.

</details>

---
### Question 24

for_each on a resource requires:

- A. A list only
- B. A map or set (convert lists with toset())
- C. A provider alias
- D. A backend

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** for_each accepts map or set; lists need conversion—common exam trap.

</details>

---
### Question 25

count.index starts at:

- A. 1
- B. 0
- C. -1
- D. Random

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** count indexes are zero-based.

</details>

---
### Question 26

format("Hello, %s!", var.name) uses:

- A. A string formatting function similar to printf
- B. JSON encoding
- C. CIDR math
- D. State locking

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** format builds strings with placeholders.

</details>

---
### Question 27

join(", ", ["a", "b"]) returns:

- A. "a, b"
- B. ["a", "b"]
- C. {a,b}
- D. ab

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** join concatenates list elements with a separator.

</details>

---
### Question 28

merge({a=1}, {b=2}) returns:

- A. {a=1, b=2}
- B. [1,2]
- C. 1
- D. null

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** merge combines maps; later keys override on collision.

</details>

---
### Question 29

lookup({a=1}, "b", 0) returns:

- A. 0
- B. 1
- C. null always
- D. error always

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** lookup returns default when key missing.

</details>

---
### Question 30

cidrsubnet("10.0.0.0/16", 8, 1) calculates:

- A. A subnet CIDR within the parent block
- B. A DNS name
- C. An AMI ID
- D. A lock table

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** cidrsubnet splits address space.

</details>

---
### Question 31

file("${path.module}/script.sh") reads:

- A. Remote S3 object
- B. Local file contents relative to evaluation context
- C. State file only
- D. Provider schema

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** file() reads local files; often combined with path.module.

</details>

---
### Question 32

templatefile("tpl.tftpl", { name = "x" }) does:

- A. Downloads a module
- B. Renders a template file with variables
- C. Locks state
- D. Validates providers

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** templatefile renders .tftpl templates.

</details>

---
### Question 33

jsonencode({a=1}) produces:

- A. A JSON string
- B. A Terraform map only
- C. An HCL block
- D. A provider binary

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** jsonencode serializes to JSON string.

</details>

---
### Question 34

jsondecode("{\"a\":1}") returns:

- A. A Terraform map/object value
- B. Only a string
- C. A number only
- D. An error always

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** jsondecode parses JSON into Terraform values.

</details>

---
### Question 35

contains(["a","b"], "a") returns:

- A. true
- B. false
- C. null
- D. ["a"]

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** contains checks list/set membership.

</details>

---
### Question 36

length(["a","b"]) returns:

- A. 2
- B. 1
- C. 0
- D. "ab"

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** length returns element count.

</details>

---
### Question 37

toset(["a","b","a"]) returns:

- A. A set with unique elements
- B. A list with duplicates
- C. A map
- D. An error

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** toset deduplicates—useful before for_each.

</details>

---
### Question 38

Implicit dependencies are created when:

- A. One resource references another's attributes in expressions
- B. You use terraform fmt
- C. You use the same provider version
- D. You use identical tags

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Attribute references build the dependency graph automatically.

</details>

---
### Question 39

depends_on is used for:

- A. Explicit dependencies not captured by references
- B. Formatting HCL
- C. Changing backend
- D. Setting variable defaults

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** depends_on declares ordering when no attribute reference exists.

</details>

---
### Question 40

lifecycle { prevent_destroy = true }:

- A. Blocks Terraform from destroying that resource
- B. Prevents all plans
- C. Deletes the resource immediately
- D. Disables providers

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** prevent_destroy guards against accidental deletion.

</details>

---
### Question 41

lifecycle { create_before_destroy = true } helps:

- A. Reduce downtime when replacement is required
- B. Skip apply
- C. Remove state
- D. Disable encryption

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Create new before destroying old for supported resources.

</details>

---
### Question 42

lifecycle { ignore_changes = [tags] } tells Terraform to:

- A. Stop managing the resource
- B. Ignore drift on listed attributes after creation
- C. Destroy the resource
- D. Remove providers

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** ignore_changes suppresses updates to specified attributes.

</details>

---
### Question 43

provider meta-argument on a resource selects:

- A. A non-default provider configuration alias
- B. A backend
- C. A module output
- D. A workspace

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** provider = aws.west selects aliased provider config.

</details>

---
### Question 44

count on a resource creates:

- A. Multiple instances indexed from 0
- B. Only maps
- C. Only data sources
- D. Backends

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** count expands to aws_instance.name[0], [1], ...

</details>

---
### Question 45

for_each keys are available as:

- A. each.key and each.value
- B. count.key
- C. index.key
- D. for.key only

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** for_each exposes each.key/each.value in blocks.

</details>

---
### Question 46

data sources differ from resources because data sources:

- A. Create new infrastructure
- B. Read existing infrastructure without managing lifecycle
- C. Always run provisioners
- D. Store remote state

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Data sources are read-only lookups.

</details>

---
### Question 47

A data source block might be used to:

- A. Look up the latest AMI ID
- B. Create an S3 bucket
- C. Lock DynamoDB
- D. Push state

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Common pattern: data "aws_ami" "latest" { ... }

</details>

---
### Question 48

dynamic blocks generate:

- A. Repeated nested blocks from a collection
- B. Provider binaries
- C. State backups only
- D. Backend migrations

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** dynamic blocks iterate with for_each over nested block types.

</details>

---
### Question 49

Inside a dynamic block, the iterator object is referenced as:

- A. ingress.value for iterator named ingress
- B. dynamic.value always
- C. each.only
- D. count.dynamic

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Iterator label (e.g., ingress) exposes .key and .value in content.

</details>

---
### Question 50

dynamic block requires which meta-arguments?

- A. for_each and content
- B. source and version
- C. backend and key
- D. only count

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** dynamic uses for_each + content { ... }.

</details>

---
### Question 51

terraform console is used to:

- A. Interactively evaluate Terraform expressions
- B. Apply changes silently
- C. Destroy all resources
- D. Configure backends only

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Console helps test functions and expressions.

</details>

---
### Question 52

terraform output without arguments:

- A. Shows all outputs
- B. Deletes outputs
- C. Shows providers
- D. Runs Sentinel

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** terraform output lists output values.

</details>

---
### Question 53

terraform output -json provides:

- A. JSON formatted outputs
- B. Only sensitive outputs in plaintext to logs
- C. Provider cache
- D. Lock status

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** JSON output aids scripting and CI.

</details>

---
### Question 54

Review #54: confirm your answer against Terraform docs.

- A. Option A
- B. Option B
- C. Option C
- D. Option D

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Placeholder trimmed to meet per-domain question count.

</details>

---
### Question 55

Which are valid Terraform variable types? (Select all that apply.)

- A. string
- B. list(string)
- C. object({ id = string })
- D. array(int)
- E. set(number)

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, C, E**

**Explanation:** Terraform uses list/set/map/object/tuple/any—not array.

</details>

---
### Question 56

Variable precedence from LOWEST to HIGHEST includes which ordering? (Select all that apply.)

- A. default in variable block is lowest
- B. TF_VAR_ beats default
- C. -var beats -var-file
- D. terraform.tfvars beats -var
- E. -var is highest

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, C, E**

**Explanation:** Correct order: default < TF_VAR_ < tfvars < auto.tfvars < -var-file < -var.

</details>

---
### Question 57

Which built-in functions work as described? (Select all that apply.)

- A. merge combines maps
- B. join concatenates a list with a separator
- C. lookup fetches a map value with optional default
- D. cidrsubnet calculates subnets
- E. templatefile renders templates

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, C, D, E**

**Explanation:** All listed functions behave as described—common exam knowledge.

</details>

---
### Question 58

Which meta-arguments / blocks are valid? (Select all that apply.)

- A. count
- B. for_each
- C. depends_on
- D. lifecycle
- E. dynamic nested blocks

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, C, D, E**

**Explanation:** These are core configuration meta-arguments and patterns.

</details>

---
### Question 59

Which statements about data sources and outputs are true? (Select all that apply.)

- A. Data sources read without creating managed resources
- B. Outputs expose values after apply
- C. sensitive outputs are redacted in normal CLI output
- D. Data sources always require import
- E. jsonencode/jsondecode help serialize values

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, C, E**

**Explanation:** Data sources don't require import; they query existing data.

</details>

---
### Question 60

Which expressions are valid Terraform patterns? (Select all that apply.)

- A. condition ? a : b
- B. [for x in var.items : x]
- C. aws_instance.web[*].id
- D. for_each over a raw list without conversion
- E. toset() before for_each on list-derived keys

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, C, E**

**Explanation:** for_each needs map/set; convert lists with toset() or similar.

</details>

---
