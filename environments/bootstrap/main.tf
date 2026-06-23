locals {
  bootstrap_project = "lz-security"
}

module "state_bucket" {

  source = "../../modules/state-bucket"

  bucket_name = "khushi-tf-state"
}

module "terraform_sa" {

  source = "../../modules/terraform-sa"
}

resource "google_organization_iam_member" "terraform_folder_admin" {

  org_id = 423969081969

  role = "roles/resourcemanager.folderAdmin"

  member = "serviceAccount:${module.terraform_sa.email}"
}

