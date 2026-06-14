resource "google_compute_firewall" "allow_internal" {
  name    = "allow-internal"
  project = var.project_id
  network = var.network_name

  direction = "INGRESS"

  source_ranges = [
    "10.10.0.0/8"
  ]

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  allow {
    protocol = "icmp"
  }
}


resource "google_compute_firewall" "allow_iap_ssh" {
  name    = "allow-iap-ssh"
  project = var.project_id
  network = var.network_name

  direction = "INGRESS"

  source_ranges = [
    "35.235.240.0/20"
  ]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "allow_health_checks" {
  name    = "allow-health-checks"
  project = var.project_id
  network = var.network_name

  direction = "INGRESS"

  source_ranges = [
    "130.211.0.0/22",
    "35.191.0.0/16"
  ]

  allow {
    protocol = "tcp"
  }
}
