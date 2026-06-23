locals {
  org_id = "423969081969"
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
      "user:khushig080803@gmail.com"
    ]

    "roles/compute.networkAdmin" = [
      "user:khushig080803@gmail.com"
    ]

    "roles/resourcemanager.folderAdmin" = [
      "user:khushig080803@gmail.com"
    ]
  }
}

module "logging" {
  source = "../../modules/logging"

  organization_id = local.org_id

  project_id = "khushi-lz-logging"
}
