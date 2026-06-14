output "bucket_name" {
  value = google_logging_project_bucket_config.central_logs.bucket_id
}

output "sink_name" {
  value = google_logging_organization_sink.org_sink.name
}
