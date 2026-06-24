terraform {
  backend "gcs" {
    bucket = "khushi-tf-state-423969081969"
    prefix = "bootstrap"
  }
}
