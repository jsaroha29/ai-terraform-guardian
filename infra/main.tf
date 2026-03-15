
resource "random_pet" "name" {
  length    = 2
  separator = "-"
}

resource "random_integer" "ttl_days" {
  min = 7
  max = 90
}

locals {
  standard_tags = {
    owner       = "platform-engineering"
    managed_by  = "terraform"
    repo        = "ai-terraform-guardian"
    cost_center = "devops"
  }
}