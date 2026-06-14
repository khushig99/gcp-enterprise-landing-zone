resource "google_compute_network" "vpc" {
  name                    = var.network_name
  project                 = var.project_id

  auto_create_subnetworks = false

  routing_mode            = "GLOBAL"
}

resource "google_compute_subnetwork" "subnets" {
  for_each = {
    for subnet in var.subnets :
    subnet.name => subnet
  }

  name                     = each.value.name
  ip_cidr_range            = each.value.cidr
  region                   = each.value.region
  network                  = google_compute_network.vpc.id
  project                  = var.project_id

  private_ip_google_access = each.value.private_access
}
