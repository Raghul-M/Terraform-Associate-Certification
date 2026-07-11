# Terraform Associate 004 — Study Notes

Learn each domain here, run the matching [examples](../examples/README.md), then test yourself with the [questions](../questions/README.md) bank.

## Study Flow

```
1. Read notes/{topic}/notes.md        ← Learn concepts
2. Run examples/{topic}/…             ← Hands-on
3. Do questions/{topic}/questions.md  ← Test knowledge
4. Re-read notes for weak areas
```

## Notes by Domain

| # | Notes | Examples | Questions | Domain | Weight |
|---|-------|----------|-----------|--------|--------|
| 1 | [01-infrastructure-as-code](01-infrastructure-as-code/notes.md) | [lab](../examples/01-infrastructure-as-code/declarative-local-file/) | [60 Q](../questions/01-infrastructure-as-code/questions.md) | Understand IaC | 5–7% |
| 2 | [02-terraform-purpose](02-terraform-purpose/notes.md) | [lab](../examples/02-terraform-purpose/provider-agnostic/) | [60 Q](../questions/02-terraform-purpose/questions.md) | Terraform vs Other IaC | 7–9% |
| 3 | [03-terraform-basics](03-terraform-basics/notes.md) | [lab](../examples/03-terraform-basics/provider-versions-resource/) | [60 Q](../questions/03-terraform-basics/questions.md) | Terraform Basics | 10–12% |
| 4 | [04-terraform-cli](04-terraform-cli/notes.md) | [lab](../examples/04-terraform-cli/fmt-validate-console/) | [60 Q](../questions/04-terraform-cli/questions.md) | CLI (Outside Core Workflow) | 8–10% |
| 5 | [05-modules](05-modules/notes.md) | [lab](../examples/05-modules/local-file-module/) | [60 Q](../questions/05-modules/questions.md) | Modules | 8–10% |
| 6 | [06-core-workflow](06-core-workflow/notes.md) | [lab](../examples/06-core-workflow/init-plan-apply/) | [60 Q](../questions/06-core-workflow/questions.md) | Core Workflow | 8–10% |
| 7 | [07-state-management](07-state-management/notes.md) | [lab](../examples/07-state-management/state-and-backends/) | [60 Q](../questions/07-state-management/questions.md) | State Management | 12–15% |
| 8 | [08-configuration](08-configuration/notes.md) | [labs](../examples/08-configuration/) | [60 Q](../questions/08-configuration/questions.md) | Configuration | 15–18% |
| 9 | [09-hcp-terraform](09-hcp-terraform/notes.md) | [lab](../examples/09-hcp-terraform/cloud-block/) | [60 Q](../questions/09-hcp-terraform/questions.md) | HCP Terraform | 8–10% |

## 10-Day Plan Mapping

| Day | preparation.md Section | Notes Folder |
|-----|------------------------|--------------|
| Day 1 | IaC Concepts | 01 + 02 |
| Day 2 | Terraform Basics | 03 |
| Day 3 | Core Workflow | 06 |
| Day 4 | Resources & Meta-Args | 08 |
| Day 5 | Variables & Expressions | 08 |
| Day 6 | State Management | 07 |
| Day 7 | Modules | 05 |
| Day 8 | Import, Workspaces, CLI | 04 |
| Day 9 | HCP Terraform | 09 |
| Day 10 | Review | All folders |

## Exam Night Priority

1. **08-configuration** (15–18%)
2. **07-state-management** (12–15%)
3. **03-terraform-basics** (10–12%)
