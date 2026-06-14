resource "google_iam_workload_identity_pool" "github" {

  workload_identity_pool_id = "github-pool"

  display_name = "GitHub Actions Pool"
}

resource "google_service_account_iam_member" "github" {

  service_account_id =
    "projects/-/serviceAccounts/${var.terraform_sa_email}"

  role = "roles/iam.workloadIdentityUser"

  member =
    "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github.name}/attribute.repository/${var.github_repository}"
}
