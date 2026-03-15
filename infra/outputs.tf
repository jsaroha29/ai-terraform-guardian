output "generated_name" {
  description = "A randomly generated name to prove terraform plan/apply works without cloud creds."
  value       = random_pet.name.id
}

output "ttl_days" {
  description = "Random TTL in days. Demonstrates non-determinism and plan visibility."
  value       = random_integer.ttl_days.result
}