resource "google_service_account" "terraform" {

  account_id = "terraform-deployer"

  display_name = "Terraform Deployment Service Account"
}
