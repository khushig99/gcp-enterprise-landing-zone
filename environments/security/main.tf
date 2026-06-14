locals {
  org_id = "543675347962"
}

module "org_policy" {
  source = "../../modules/org-policy"

  organization_id = local.org_id
}

locals {
  org_id = "543675347962"
}

module "org_policy" {
  source = "../../modules/org-policy"

  organization_id = local.org_id
}

module "iam" {
  source = "../../modules/iam"

  organization_id = local.org_id

  bindings = {

    "roles/viewer" = [
      "group:auditors@example.com"
    ]

    "roles/compute.networkAdmin" = [
      "group:network-admins@example.com"
    ]

    "roles/resourcemanager.folderAdmin" = [
      "group:platform-admins@example.com"
    ]
  }
}
