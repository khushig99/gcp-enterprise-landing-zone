resource "google_iam_workload_identity_pool_provider" "github" {

  workload_identity_pool_id =
    google_iam_workload_identity_pool.github.workload_identity_pool_id

  workload_identity_pool_provider_id = "github-provider"

  display_name = "GitHub OIDC"

  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.repository" = "assertion.repository"
  }

  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}
