locals {
  org_id = "543675347962"
}

module "prod_folder" {
  source = "../../modules/folder"

  display_name = "Prod"
  parent       = "organizations/${local.org_id}"
}

module "nonprod_folder" {
  source = "../../modules/folder"

  display_name = "NonProd"
  parent       = "organizations/${local.org_id}"
}

module "security_folder" {
  source = "../../modules/folder"

  display_name = "Security-Network"
  parent       = "organizations/${local.org_id}"
}
