#!/usr/bin/env bash
# CLI commands outside the core write→plan→apply workflow.
# Run from this directory after: terraform init && terraform apply -auto-approve
set -euo pipefail

echo "== terraform fmt =="
terraform fmt -check -diff || terraform fmt

echo "== terraform validate =="
terraform validate

echo "== terraform providers =="
terraform providers

echo "== terraform output =="
terraform output

echo "== terraform show (state summary) =="
terraform show -no-color | head -n 40

echo "== terraform console (example: type local_file.cli_demo.filename then Ctrl-D) =="
echo 'local_file.cli_demo.filename' | terraform console

echo "== Help =="
terraform -help | head -n 20
# Per-command help: terraform validate -help
#
# force-unlock: unlocks a stuck remote state lock (needs LOCK_ID).
#   terraform force-unlock LOCK_ID
# Only for remote backends with locking — do not use casually.
