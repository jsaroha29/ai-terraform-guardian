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

### Detected file changes
```
A  infra/.terraform.lock.hcl
A  infra/.terraform/providers/registry.terraform.io/hashicorp/random/3.8.1/linux_amd64/LICENSE.txt
A  infra/.terraform/providers/registry.terraform.io/hashicorp/random/3.8.1/linux_amd64/terraform-provider-random_v3.8.1_x5
M  infra/README.md
```
