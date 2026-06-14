resource "google_monitoring_alert_policy" "high_cpu" {

  display_name = "High CPU Usage"

  combiner = "OR"

  conditions {

    display_name = "CPU > 80%"

    condition_threshold {

      filter = <<EOT
metric.type="compute.googleapis.com/instance/cpu/utilization"
resource.type="gce_instance"
EOT

      comparison      = "COMPARISON_GT"
      threshold_value = 0.8
      duration        = "300s"

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
      }
    }
  }

  notification_channels = var.notification_channels
}
