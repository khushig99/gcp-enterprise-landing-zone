output "firewall_rules" {
  value = [
    google_compute_firewall.allow_internal.name,
    google_compute_firewall.allow_iap_ssh.name,
    google_compute_firewall.allow_health_checks.name
  ]
}
