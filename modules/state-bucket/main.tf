resource "google_storage_bucket" "terraform_state" {

  name = var.bucket_name

  location = "ASIA"

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    condition {
      age = 365
    }

    action {
      type = "Delete"
    }
  }
}
