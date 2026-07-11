# Understand Infrastructure as Code (IaC)

> **Exam Domain:** Understand Infrastructure as Code (IaC) | **Weight:** 5-7%
> **Questions:** 60 | **Format:** Multiple choice & multi-select (like Terraform Associate 004)

Covers IaC concepts, declarative vs imperative approaches, benefits of automation, and how Terraform fits the IaC landscape.

**Instructions:** Answer each question, then expand the dropdown to check your answer and explanation.

---

### Question 1

What is Infrastructure as Code (IaC)?

- A. Managing infrastructure exclusively through a cloud provider's web console
- B. Defining and managing infrastructure using machine-readable configuration files
- C. Writing shell scripts that SSH into servers to install packages
- D. Storing infrastructure diagrams in a wiki for operations teams

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** IaC defines infrastructure in version-controlled configuration files rather than manual steps or ad hoc scripts.

</details>

---
### Question 2

Which practice is a primary benefit of Infrastructure as Code?

- A. Eliminating the need for cloud provider APIs
- B. Storing infrastructure definitions in version control for history and collaboration
- C. Guaranteeing zero downtime for every deployment
- D. Removing the need to test changes before production

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Version control enables change history, reviews, rollbacks, and team collaboration on infrastructure definitions.

</details>

---
### Question 3

In a declarative IaC approach, what does the practitioner primarily specify?

- A. The exact sequence of API calls to reach the desired state
- B. The desired end state of infrastructure
- C. The order of shell commands on each host
- D. The IP addresses of existing servers only

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Declarative IaC describes what infrastructure should look like; the tool determines how to achieve that state.

</details>

---
### Question 4

Which statement best describes an imperative approach to infrastructure management?

- A. You declare the target state and the tool reconciles differences
- B. You specify step-by-step commands to perform
- C. You only store infrastructure in JSON templates
- D. You never change infrastructure after initial creation

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Imperative approaches focus on how to execute changes (commands/steps), not just the desired outcome.

</details>

---
### Question 5

Terraform is best classified as which type of IaC tool?

- A. Imperative configuration management
- B. Declarative infrastructure provisioning
- C. Agent-based host patching system
- D. Manual runbook automation only

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Terraform uses declarative HCL to describe desired infrastructure and provisions it through providers.

</details>

---
### Question 6

What does idempotency mean in the context of IaC?

- A. Each apply must destroy all resources first
- B. Applying the same configuration repeatedly yields the same result without unintended side effects
- C. Only one person can run apply at a time
- D. Resources can never be updated after creation

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Idempotent operations produce consistent outcomes when repeated; Terraform aims for this during plan/apply.

</details>

---
### Question 7

Which scenario best illustrates immutable infrastructure?

- A. SSH into a server and patch packages in place
- B. Replace a failed instance with a new one built from the same image/config
- C. Manually edit security group rules in the console
- D. Store server state only on local disks without backups

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Immutable infrastructure favors replacing components with new instances rather than modifying running ones in place.

</details>

---
### Question 8

Terraform is developed by which company and written in which language?

- A. Amazon; Python
- B. HashiCorp; Go
- C. Microsoft; C#
- D. Google; Java

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Terraform is an open-source HashiCorp project implemented primarily in Go.

</details>

---
### Question 9

What is configuration drift?

- A. When Terraform state file is accidentally deleted
- B. When live infrastructure diverges from the defined IaC configuration
- C. When provider plugins fail to download during init
- D. When HCL syntax errors prevent validation

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Drift occurs when manual or external changes cause real infrastructure to differ from code and state.

</details>

---
### Question 10

Which are common benefits of Infrastructure as Code? (Select all that apply.)

- A. Consistency across environments
- B. Elimination of all human operational work
- C. Reusability of configuration patterns
- D. Improved auditability through version history
- E. Automation of provisioning

<details>
<summary>View Answer</summary>

**Correct Answers: A, C, D, E**

**Explanation:** IaC improves consistency, reuse, audit trails, and automation. It reduces manual work but does not eliminate all human judgment or operations.

</details>

---
### Question 11

What is the ClickOps anti-pattern?

- A. Using CLI tools instead of a GUI
- B. Making infrastructure changes only through cloud console clicks without codified definitions
- C. Automating deployments with CI pipelines
- D. Storing Terraform code in Git

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** ClickOps refers to managing infrastructure via console UI clicks, which is hard to review, reproduce, and audit.

</details>

---
### Question 12

In the cattle vs. pets metaphor, cattle servers are characterized by:

- A. Unique manual tuning and sentimental naming
- B. Being disposable and replaced rather than individually nursed back to health
- C. Never scaling horizontally
- D. Always running without automation

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Cattle are interchangeable and replaceable; pets are treated as unique, long-lived systems.

</details>

---
### Question 13

How does IaC improve reproducibility?

- A. By preventing all configuration changes forever
- B. By encoding environment definitions so they can be recreated consistently
- C. By hiding infrastructure details from developers
- D. By requiring every resource to be created manually first

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Codified definitions allow environments to be rebuilt the same way across teams, regions, and time.

</details>

---
### Question 14

Which capability supports auditability in IaC workflows?

- A. Deleting old Git commits after merge
- B. Version-controlled change history with authorship and timestamps
- C. Disabling logs on cloud APIs
- D. Storing secrets in plain text in code

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** VCS history shows who changed what and when, supporting audits and compliance reviews.

</details>

---
### Question 15

GitOps in infrastructure management typically means:

- A. Using Git as the source of truth and driving deployments from approved changes
- B. Avoiding any automation in deployment pipelines
- C. Storing only binary images in Git without configuration
- D. Prohibiting pull requests for infrastructure code

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** GitOps uses Git workflows (PRs, merges) as the control plane for desired system state, often with automated reconciliation.

</details>

---
### Question 16

Which statement about declarative IaC is TRUE?

- A. You must script every API call in order
- B. The tool compares desired state to actual state and plans changes
- C. Declarative tools cannot destroy resources
- D. Declarative configs cannot use variables

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Declarative tools reconcile desired vs. actual state; Terraform's plan shows the proposed diff.

</details>

---
### Question 17

A team applies the same Terraform configuration twice with no code or external changes. What is the expected outcome?

- A. All resources are destroyed on the second run
- B. No changes are required on the second run
- C. A new state file is created each time with different resource IDs
- D. Terraform refuses to run a second time

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Idempotent behavior means a second apply with no drift should result in no changes.

</details>

---
### Question 18

Why is manual console change a risk for IaC-managed environments?

- A. It automatically upgrades Terraform versions
- B. It can introduce drift that the next plan/apply may overwrite or conflict with
- C. It prevents provider plugins from loading
- D. It forces immediate deletion of all resources

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Manual changes cause drift; the next Terraform run may revert or fight those changes depending on lifecycle rules.

</details>

---
### Question 19

Which is NOT a typical IaC benefit?

- A. Faster, repeatable environment provisioning
- B. Peer review of infrastructure changes
- C. Guaranteed immunity to misconfiguration
- D. Documentation that stays close to actual config

<details>
<summary>View Answer</summary>

**Correct Answer: C**

**Explanation:** IaC reduces errors but does not guarantee perfect configurations; reviews and testing are still required.

</details>

---
### Question 20

Which statements about declarative vs. imperative approaches are correct? (Select all that apply.)

- A. Declarative configs describe desired end state
- B. Imperative scripts focus on the sequence of actions
- C. Terraform's primary model is imperative
- D. Declarative tools can still perform ordered operations internally
- E. Imperative tools cannot use loops

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, D**

**Explanation:** Declarative describes outcomes; imperative describes steps. Terraform is declarative, though internally it executes ordered operations. Imperative tools can use loops.

</details>

---
### Question 21

Open-source Terraform means:

- A. All cloud resources it creates are free of charge
- B. Its source code is publicly available under an open-source license
- C. It can only manage open-source software stacks
- D. It does not require provider plugins

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Open source refers to the Terraform project's code availability, not cloud billing or provider requirements.

</details>

---
### Question 22

Which practice helps reduce configuration drift?

- A. Making production changes only in the console for speed
- B. Treating the IaC repository as the source of truth and avoiding unmanaged edits
- C. Disabling terraform plan in CI
- D. Storing state only on individual laptops

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Enforcing code as source of truth and reviewing changes limits unmanaged drift.

</details>

---
### Question 23

Immutable infrastructure pairs well with IaC because:

- A. Servers never need replacement
- B. New instances can be provisioned from the same definition instead of patching in place
- C. It eliminates the need for state
- D. It requires no testing of images

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** IaC defines how new instances are built; immutability replaces rather than mutates existing instances.

</details>

---
### Question 24

What role does automation play in IaC?

- A. It removes the need for configuration files
- B. It executes defined infrastructure changes consistently without manual steps
- C. It prevents all downtime during updates
- D. It replaces version control systems

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Automation applies codified changes reliably; VCS and review processes remain important.

</details>

---
### Question 25

Which example best shows reusability in IaC?

- A. Copy-pasting console screenshots into tickets
- B. Using the same module or pattern for dev, staging, and prod with different variables
- C. Creating each environment from scratch with no shared code
- D. Documenting servers only in spreadsheets

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Parameterized modules and shared patterns enable reuse across environments.

</details>

---
### Question 26

Why might auditors prefer IaC over ClickOps?

- A. IaC hides all change history
- B. IaC changes are traceable in version control and pipelines
- C. IaC eliminates the need for access controls
- D. IaC prevents any production changes

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Traceable commits and pipeline logs support audit evidence; ClickOps lacks structured change records.

</details>

---
### Question 27

Terraform's declarative model means practitioners focus on:

- A. Writing bash loops for each API endpoint
- B. Resource blocks describing desired attributes
- C. Installing agents on every VM before provisioning
- D. Compiling HCL into ARM templates only

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Practitioners declare resources and attributes in HCL; Terraform handles provider interactions.

</details>

---
### Question 28

Idempotency helps operations teams because:

- A. Failed applies never need investigation
- B. Re-running configuration after partial failure can converge to desired state safely
- C. It guarantees resources cost nothing
- D. It removes dependency ordering

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Idempotent tools can safely retry or re-apply to reach the defined end state.

</details>

---
### Question 29

Configuration drift is MOST likely detected when:

- A. terraform validate fails due to syntax
- B. terraform plan shows unexpected changes against unchanged code
- C. terraform fmt reformats files
- D. terraform version prints the CLI version

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Plan compares desired (code+state) vs. real infrastructure; drift appears as unexpected diffs.

</details>

---
### Question 30

Which are characteristics of the pets model of infrastructure? (Select all that apply.)

- A. Servers are treated as unique and irreplaceable
- B. Manual intervention is common for recovery
- C. Servers are numbered and discarded like cattle
- D. Strong emotional or operational attachment to individual hosts
- E. Horizontal scaling with identical disposable instances

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, D**

**Explanation:** Pets are unique, manually cared for, and hard to replace. Cattle implies disposable, numbered, scaled instances.

</details>

---
### Question 31

GitOps complements IaC by:

- A. Replacing the need for any IaC language
- B. Using Git workflows to propose, review, and merge infrastructure changes
- C. Banning automated applies
- D. Storing cloud credentials in Git commits

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** GitOps applies software delivery practices (PRs, merges) to infrastructure definitions.

</details>

---
### Question 32

Which statement about consistency across environments is TRUE for IaC?

- A. Identical code with different variable values can still produce appropriately different environments
- B. All environments must use exactly the same variable values
- C. IaC cannot support multiple environments
- D. Consistency means every resource must have the same name in prod and dev

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Shared code with environment-specific variables enables consistent patterns with intentional differences.

</details>

---
### Question 33

A common misconception is that IaC eliminates operations work entirely. What is more accurate?

- A. IaC shifts work toward defining, reviewing, and governing infrastructure as code
- B. IaC means no one monitors production
- C. IaC removes the need for security practices
- D. IaC only works for on-premises data centers

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** IaC automates provisioning but still requires design, testing, monitoring, and governance.

</details>

---
### Question 34

HashiCorp Terraform is primarily used for:

- A. Application-level unit testing only
- B. Infrastructure provisioning and lifecycle management
- C. Desktop software packaging
- D. Database query optimization only

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Terraform provisions and manages infrastructure resources via providers.

</details>

---
### Question 35

Why is version control considered foundational for IaC?

- A. It encrypts cloud API traffic
- B. It tracks changes, enables collaboration, and supports rollback
- C. It downloads provider plugins automatically
- D. It replaces terraform init

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** VCS is essential for collaborative, auditable infrastructure code management.

</details>

---
### Question 36

Declarative configuration is often easier to reason about because:

- A. It hides all resource dependencies
- B. It states outcomes rather than every low-level step
- C. It cannot express updates to existing resources
- D. It requires no state tracking

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Describing desired state is typically clearer than maintaining imperative command sequences.

</details>

---
### Question 37

When infrastructure is immutable, security patching on a server often means:

- A. Editing packages live on the running instance only
- B. Building a new image/instance and replacing the old one
- C. Disabling all updates to avoid change
- D. Removing the server from Terraform state only

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Immutable patterns deploy new versions rather than mutating running systems in place.

</details>

---
### Question 38

ClickOps is considered an anti-pattern primarily because it:

- A. Uses too much automation
- B. Lacks reproducibility and peer review typical of codified workflows
- C. Requires HCL knowledge
- D. Forces multi-cloud deployments

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Console-only changes are hard to reproduce, review, and audit compared to code-driven workflows.

</details>

---
### Question 39

Reproducibility in disaster recovery is helped by IaC because:

- A. Backups are never needed
- B. Infrastructure can be recreated from stored definitions
- C. Cloud providers disable manual recovery
- D. State files are always public

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Codified definitions plus state enable rebuilding infrastructure after incidents.

</details>

---
### Question 40

Which team activity aligns with IaC auditability requirements?

- A. Merging infrastructure changes without review
- B. Requiring pull request approval for production modules
- C. Deleting Terraform state after each apply
- D. Sharing root cloud keys in chat

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** PR approvals create an auditable trail of reviewed infrastructure changes.

</details>

---
### Question 41

Which items are examples of configuration drift? (Select all that apply.)

- A. A security group rule added manually in the console
- B. A tag changed outside Terraform after last apply
- C. Running terraform fmt on unformatted files
- D. An instance type changed directly in the cloud UI
- E. Updating HCL and running terraform plan

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, D**

**Explanation:** Drift is live infrastructure differing from code/state. fmt and planning code changes are normal workflow steps, not drift.

</details>

---
### Question 42

IaC 'automation' most directly reduces:

- A. Need for architectural decisions
- B. Repetitive manual provisioning steps
- C. Cost of all cloud services to zero
- D. Requirement for provider authentication

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Automation handles repetitive provisioning; architecture and credentials remain necessary.

</details>

---
### Question 43

Terraform being open source allows organizations to:

- A. Avoid using any commercial support or products
- B. Inspect, contribute to, and adopt the tool without proprietary lock-in at the tool level
- C. Skip provider version constraints
- D. Run Terraform without a state backend

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Open source enables transparency and community contribution; organizations may still use enterprise offerings.

</details>

---
### Question 44

In imperative automation, idempotency is often:

- A. Automatic for every script
- B. Harder to guarantee without explicit checks in each step
- C. Impossible by definition
- D. Only available in declarative tools

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Imperative scripts must often include conditional logic to avoid duplicate side effects.

</details>

---
### Question 45

The cattle model encourages:

- A. Snowflake servers with unique manual configs
- B. Treating instances as interchangeable and replacing them on failure
- C. Never using autoscaling groups
- D. Avoiding infrastructure definitions in code

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Cattle infrastructure is disposable and uniform, enabling scale and simple recovery.

</details>

---
### Question 46

GitOps-driven Terraform workflows often trigger applies from:

- A. Random local laptops without review
- B. CI/CD pipelines after merged changes to tracked branches
- C. Console-only change tickets
- D. Unversioned email attachments

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Merged, reviewed code in Git commonly triggers automated plan/apply pipelines.

</details>

---
### Question 47

Which best defines Infrastructure as Code?

- A. Documenting servers in a spreadsheet after creation
- B. Managing infrastructure through machine-readable, versioned configuration
- C. Using only graphical network diagrams
- D. Running ad hoc CLI commands without saving them

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** IaC is about codified, versioned infrastructure definitions, not post-hoc documentation.

</details>

---
### Question 48

A benefit of consistency in IaC is:

- A. Dev and prod can follow the same patterns, reducing 'works on my machine' surprises
- B. All environments must share one state file
- C. Variables are not allowed
- D. Providers cannot be configured per environment

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Shared patterns with environment-specific inputs improve consistency without being identical in every detail.

</details>

---
### Question 49

Why is immutability favored in cloud-native operations?

- A. It encourages editing running production servers
- B. It reduces unpredictable state accumulated from in-place changes
- C. It eliminates the need for deployments
- D. It prevents horizontal scaling

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Replacing instances avoids hard-to-track mutations on long-lived servers.

</details>

---
### Question 50

Audit trails for infrastructure are weaker when teams rely on:

- A. Git-backed Terraform modules with CI logs
- B. Undocumented console changes by multiple admins
- C. Tagged releases of infrastructure code
- D. Approved change requests linked to commits

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Undocumented console work lacks centralized, searchable change history.

</details>

---
### Question 51

Which practices align with GitOps principles for infrastructure? (Select all that apply.)

- A. Git repository as the desired-state source of truth
- B. Pull requests for infrastructure changes
- C. Direct production console edits as the primary workflow
- D. Automated reconciliation or deployment from approved merges
- E. Storing terraform.tfstate in a public Git repo without protection

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, D**

**Explanation:** GitOps uses Git as truth, PR reviews, and automated deployment. Console-first edits and committing unprotected state violate best practices.

</details>

---
### Question 52

Terraform's relationship to HashiCorp means:

- A. Terraform only works with HashiCorp Cloud Platform
- B. Terraform is a HashiCorp product with an ecosystem of providers and enterprise offerings
- C. Terraform cannot be used without a HashiCorp license in all cases
- D. Terraform is unrelated to HashiCorp commercial products

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Terraform is developed by HashiCorp; the core CLI is open source with optional commercial platforms.

</details>

---
### Question 53

Idempotency does NOT mean that:

- A. Repeated runs are safe when configuration is unchanged
- B. The tool will never return errors
- C. The end state matches the declared configuration
- D. Unnecessary changes are avoided when already converged

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Idempotency concerns outcome consistency, not error-free execution in all failure scenarios.

</details>

---
### Question 54

When comparing IaC to manual operations, reusability means:

- A. Every project must duplicate all code with no sharing
- B. Modules and patterns can be shared across teams and projects
- C. Only one cloud region can ever be used
- D. Console wizards store reusable templates automatically

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Reusable modules and patterns are a core IaC advantage over one-off manual setups.

</details>

---
### Question 55

Configuration drift can cause terraform plan to show:

- A. No output ever
- B. Updates or replacements to realign infrastructure with code
- C. Only provider download messages
- D. Automatic terraform fmt changes

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Plan proposes changes to correct differences between actual infrastructure and desired configuration.

</details>

---
### Question 56

Declarative IaC tools still require practitioners to understand:

- A. Nothing about cloud services
- B. Resource dependencies, provider behavior, and lifecycle implications
- C. Only graphical design tools
- D. How to manually SSH to every resource

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Declarative does not mean magic; correct modeling and dependencies still matter.

</details>

---
### Question 57

The open-source nature of Terraform primarily affects:

- A. Availability and community development of the core CLI
- B. Whether AWS charges for EC2
- C. Mandatory use of a specific state backend vendor
- D. Elimination of all provider authentication

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** Open source governs the Terraform core project; cloud billing and auth are separate concerns.

</details>

---
### Question 58

ClickOps is MOST directly opposed to:

- A. Peer-reviewed, version-controlled infrastructure changes
- B. Using providers for multiple clouds
- C. Storing outputs in terraform outputs
- D. Running terraform validate locally

<details>
<summary>View Answer</summary>

**Correct Answer: A**

**Explanation:** ClickOps bypasses codified, reviewable workflows that IaC promotes.

</details>

---
### Question 59

Immutable infrastructure and IaC together support:

- A. Snowflake production servers
- B. Repeatable builds and controlled rollouts via new instances
- C. Avoiding all change management
- D. Eliminating terraform state

<details>
<summary>View Answer</summary>

**Correct Answer: B**

**Explanation:** Codified builds plus replacement-based updates enable controlled, repeatable rollouts.

</details>

---
### Question 60

Which are valid IaC benefits emphasized on the Terraform Associate exam? (Select all that apply.)

- A. Version control integration
- B. Automation of provisioning
- C. Guaranteed zero security incidents
- D. Consistency across environments
- E. Reusability through modules and patterns

<details>
<summary>View Answer</summary>

**Correct Answers: A, B, D, E**

**Explanation:** Version control, automation, consistency, and reuse are core IaC benefits. No tool guarantees zero security incidents.

</details>

---
