resource "google_org_policy_policy" "allowed_locations" {

  name   = "organizations/${var.organization_id}/policies/gcp.resourceLocations"
  parent = "organizations/${var.organization_id}"

  spec {

    rules {

      values {
        allowed_values = [
          "in:asia-locations"
        ]
      }
    }
  }
}

resource "google_org_policy_policy" "disable_external_ip" {

  name   = "organizations/${var.organization_id}/policies/compute.vmExternalIpAccess"

  parent = "organizations/${var.organization_id}"

  spec {

    rules {
      deny_all = true
    }
  }
}

resource "google_org_policy_policy" "disable_sa_keys" {

  name   = "organizations/${var.organization_id}/policies/iam.disableServiceAccountKeyCreation"

  parent = "organizations/${var.organization_id}"

  spec {

    rules {
      enforce = true
    }
  }
}

resource "google_org_policy_policy" "require_os_login" {

  name   = "organizations/${var.organization_id}/policies/compute.requireOsLogin"

  parent = "organizations/${var.organization_id}"

  spec {

    rules {
      enforce = true
    }
  }
}
