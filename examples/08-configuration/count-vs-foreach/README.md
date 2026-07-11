# Domain 08c — count vs for_each

**Learning goal:** When to use `count` vs `for_each`. **`count` is NOT deprecated.**

**Notes:** [notes/08-configuration](../../../notes/08-configuration/notes.md)  
**Questions:** [questions/08-configuration](../../../questions/08-configuration/questions.md)

| Meta-arg | Tracking | Best for |
|----------|----------|----------|
| `count` | Index `res[0]` | N identical resources |
| `for_each` | Key `res["dev"]` | Distinct named resources (maps/sets) |

## Run

```bash
cd examples/08-configuration/count-vs-foreach
terraform init
terraform apply -auto-approve
terraform state list
```

## Exam tip

Prefer `for_each` when removing one item from a list would reshuffle indexes under `count`.
