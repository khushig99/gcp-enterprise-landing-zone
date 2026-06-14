output "org_policies_applied" {
  value = [
    google_org_policy_policy.allowed_locations.name,
    google_org_policy_policy.disable_external_ip.name,
    google_org_policy_policy.disable_sa_keys.name,
    google_org_policy_policy.require_os_login.name
  ]
}
