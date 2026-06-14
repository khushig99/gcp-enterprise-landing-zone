locals {
  projects = {
    shared_vpc = "lz-shared-vpc-host"
    logging    = "lz-logging"
    security   = "lz-security"

    dev        = "lz-dev"
    qa         = "lz-qa"
    sandbox    = "lz-sandbox"

    prod_app   = "lz-prod-app"
    prod_data  = "lz-prod-data"
  }
}
