resource "google_iam_workload_identity_pool" "github" {

  workload_identity_pool_id = "github-pool"

  display_name = "GitHub Actions Pool"
}

resource "google_iam_workload_identity_pool_provider" "github" {

  workload_identity_pool_id = google_iam_workload_identity_pool.github.workload_identity_pool_id

  workload_identity_pool_provider_id = "github-provider"

  display_name = "GitHub Actions Provider"

  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.repository" = "assertion.repository"
  }

  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}

resource "google_service_account_iam_member" "github" {

  service_account_id = "projects/-/serviceAccounts/${var.terraform_sa_email}"

  role = "roles/iam.workloadIdentityUser"

  member = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github.name}/attribute.repository/${var.github_repository}"
}
