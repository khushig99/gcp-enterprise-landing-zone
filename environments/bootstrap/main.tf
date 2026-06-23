module "state_bucket" {

  source = "../../modules/state-bucket"

  bucket_name = "khushi-tf-state"
}

module "terraform_sa" {

  source = "../../modules/terraform-sa"
}

module "workload_identity" {
  source = "../../modules/workload-identity"

  terraform_sa_email = module.terraform_sa.email

  github_repository  = "khushig99/gcp-enterprise-landing-zone"
}

resource "google_organization_iam_member" "terraform_folder_admin" {

  org_id = 423969081969

  role = "roles/resourcemanager.folderAdmin"

  member = "serviceAccount:${module.terraform_sa.email}"
}

