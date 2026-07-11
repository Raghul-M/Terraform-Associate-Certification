# Terraform Associate 004 — Practice Questions

**540 exam-style questions** aligned with your [preparation.md](../preparation.md) study guide and official HashiCorp Terraform Associate 004 objectives.

> **Study first:** Read the matching [notes](../notes/README.md) and run the [examples](../examples/README.md) for each topic, then test yourself here.

## How to Use

1. Read [notes/{topic}/notes.md](../notes/README.md) to learn the concepts
2. Run the matching lab under [examples/](../examples/README.md)
3. Open the matching `questions.md` file below
4. Use **Markdown Preview** in your editor (Cmd+Shift+V in VS Code/Cursor)
5. Answer each question, then click **View Answer** to reveal the correct answer and explanation

## Question Banks by Domain

| # | Folder | Domain | Weight | Questions | Example |
|---|--------|--------|--------|-----------|---------|
| 1 | [01-infrastructure-as-code](01-infrastructure-as-code/questions.md) | Understand Infrastructure as Code (IaC) | 5–7% | 60 | [lab](../examples/01-infrastructure-as-code/declarative-local-file/) |
| 2 | [02-terraform-purpose](02-terraform-purpose/questions.md) | Understand the Purpose of Terraform (vs Other IaC) | 7–9% | 60 | [lab](../examples/02-terraform-purpose/provider-agnostic/) |
| 3 | [03-terraform-basics](03-terraform-basics/questions.md) | Understand Terraform Basics | 10–12% | 60 | [lab](../examples/03-terraform-basics/provider-versions-resource/) |
| 4 | [04-terraform-cli](04-terraform-cli/questions.md) | Use Terraform CLI (Outside of Core Workflow) | 8–10% | 60 | [lab](../examples/04-terraform-cli/fmt-validate-console/) |
| 5 | [05-modules](05-modules/questions.md) | Interact with Terraform Modules | 8–10% | 60 | [lab](../examples/05-modules/local-file-module/) |
| 6 | [06-core-workflow](06-core-workflow/questions.md) | Use the Core Terraform Workflow | 8–10% | 60 | [lab](../examples/06-core-workflow/init-plan-apply/) |
| 7 | [07-state-management](07-state-management/questions.md) | Implement and Maintain State | 12–15% | 60 | [lab](../examples/07-state-management/state-and-backends/) |
| 8 | [08-configuration](08-configuration/questions.md) | Read, Generate, and Modify Configuration | 15–18% | 60 | [labs](../examples/08-configuration/) |
| 9 | [09-hcp-terraform](09-hcp-terraform/questions.md) | Understand HCP Terraform Capabilities | 8–10% | 60 | [lab](../examples/09-hcp-terraform/cloud-block/) |

## Exam Night Study Priority

Focus extra time on the **highest-weight** domains (these carry ~27–33% of the exam):

1. **08-configuration** (15–18%) — variables, functions, meta-arguments, dynamic blocks
2. **07-state-management** (12–15%) — backends, locking, state commands, drift
3. **03-terraform-basics** (10–12%) — providers, versioning, HCL structure

## Format

- ~54 single-choice + ~6 multi-select per domain (matches real exam mix)
- Each answer includes an explanation with common exam traps
- Dropdown answers use HTML `<details>` — works in Markdown Preview

## Regenerate Questions

```bash
python3 questions/generate_questions.py
```

## Official Resources

- [HashiCorp Associate 004 Study Guide](https://developer.hashicorp.com/terraform/tutorials/certification-004/associate-study-004)
- [Official Sample Questions](https://developer.hashicorp.com/terraform/tutorials/certification-004/associate-review-004)
