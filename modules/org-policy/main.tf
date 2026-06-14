resource "google_org_policy_policy" "disable_external_ip" {
  name   = "organizations/${var.org_id}/policies/compute.vmExternalIpAccess"

  parent = "organizations/${var.org_id}"

  spec {
    rules {
      deny_all = true
    }
  }
}
