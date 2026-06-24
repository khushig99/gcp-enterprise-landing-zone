locals {
  host_project_id = "lz-shared-vpc-host"
}

module "network" {
  source = "../../modules/network"

  project_id   = local.host_project_id
  network_name = "enterprise-vpc"

  subnets = [
    {
      name           = "prod-subnet"
      cidr           = "10.10.0.0/20"
      region         = "asia-south1"
      private_access = true
    },
    {
      name           = "nonprod-subnet"
      cidr           = "10.20.0.0/20"
      region         = "asia-south1"
      private_access = true
    },
    {
      name           = "management-subnet"
      cidr           = "10.30.0.0/24"
      region         = "asia-south1"
      private_access = true
    }
  ]
}
module "firewall" {
  source = "../../modules/firewall"

  project_id   = local.host_project_id
  network_name = module.network.network_name
}

module "shared_vpc" {
  source = "../../modules/shared-vpc"

  host_project_id = local.host_project_id

  service_project_ids = [
    "lz-dev",
    "lz-qa",
    "lz-sandbox",
    "lz-prod-app",
    "lz-prod-data"
  ]
}

module "cloud_nat" {
  source = "../../modules/cloud-nat"

  project_id = local.host_project_id
  region     = "asia-south1"

  network_name = module.network.network_name

  router_name = "enterprise-router"
  nat_name    = "enterprise-nat"
}
