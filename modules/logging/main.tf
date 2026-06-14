resource "google_logging_project_bucket_config" "central_logs" {

  project        = var.project_id

  location       = "global"

  retention_days = 365

  bucket_id      = "central-log-bucket"
}

resource "google_logging_organization_sink" "org_sink" {

  org_id = var.organization_id

  name = "organization-central-sink"

  destination = "logging.googleapis.com/projects/${var.project_id}/locations/global/buckets/${google_logging_project_bucket_config.central_logs.bucket_id}"

  include_children = true
}

resource "google_project_iam_member" "sink_writer" {

  project = var.project_id

  role = "roles/logging.bucketWriter"

  member = google_logging_organization_sink.org_sink.writer_identity
}
