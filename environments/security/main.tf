locals {
  org_id = "423969081969"
}

module "org_policy" {
  source = "../../modules/org-policy"

  organization_id = local.org_id
}

locals {
  org_id = "543675347962"
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

module "logging" {

  source = "../../modules/logging"

  organization_id = local.org_id

  project_id = "lz-logging"
}
