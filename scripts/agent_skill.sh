#!/usr/bin/env bash
set -euo pipefail

# This script represents the "agent skill" hook.
# In enterprise, replace the body with:
# - internal agent runner call
# - MCP client invocation
# - custom GitHub Action
# - or gh copilot (if allowed in your environment)

CHANGES="$(git status --porcelain || true)"

cat > PR_BODY.md <<'MD'
## 🤖 AI Terraform Guardian – Nightly Maintenance PR

This PR was generated automatically to keep Terraform code healthy and review-ready.

### What the workflow did
- Ran `terraform fmt -recursive`
- Ran `terraform validate`
- Regenerated `terraform-docs` content (module docs)

### Why this matters
- Keeps diffs small, style consistent, and docs always current.
- Reduces manual toil and improves PR quality.

### Next enhancements (optional)
- Add policy-as-code checks (OPA/Conftest)
- Add drift detection for real environments
- Add module version bump automation
MD

if [[ -n "$CHANGES" ]]; then
  echo "" >> PR_BODY.md
  echo "### Detected file changes" >> PR_BODY.md
  echo '```' >> PR_BODY.md
  echo "$CHANGES" >> PR_BODY.md
  echo '```' >> PR_BODY.md
fi

echo "Agent skill step completed. PR_BODY.md generated."