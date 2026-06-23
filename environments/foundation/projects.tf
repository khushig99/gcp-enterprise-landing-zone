locals {
  projects = {
    shared_vpc = "khushi-lz-shared-vpc"
    logging    = "khushi-lz-logging"
    security   = "khushi-lz-security"

    dev        = "khushi-lz-dev"
    qa         = "khushi-lz-qa"
    sandbox    = "khushi-lz-sandbox"

    prod_app   = "khushi-lz-prod-app"
    prod_data  = "khushi-lz-prod-data"
  }
}

module "shared_vpc_project" {
  source = "../../modules/project"

  name            = "Shared VPC Host"
  project_id      = local.projects.shared_vpc
  folder_id       = module.security_folder.folder_id
  billing_account = var.billing_account
}

module "security_project" {
  source = "../../modules/project"

  name            = "Security"
  project_id      = local.projects.security
  folder_id       = module.security_folder.folder_id
  billing_account = var.billing_account
}

module "logging_project" {
  source = "../../modules/project"

  name            = "Logging"
  project_id      = local.projects.logging
  folder_id       = module.security_folder.folder_id
  billing_account = var.billing_account
}

module "dev_project" {
  source = "../../modules/project"

  name            = "Dev"
  project_id      = local.projects.dev
  folder_id       = module.nonprod_folder.folder_id
  billing_account = var.billing_account
}

module "qa_project" {
  source = "../../modules/project"

  name            = "QA"
  project_id      = local.projects.qa
  folder_id       = module.nonprod_folder.folder_id
  billing_account = var.billing_account
}

module "sandbox_project" {
  source = "../../modules/project"

  name            = "Sandbox"
  project_id      = local.projects.sandbox
  folder_id       = module.nonprod_folder.folder_id
  billing_account = var.billing_account
}

module "prod_app_project" {
  source = "../../modules/project"

  name            = "Prod App"
  project_id      = local.projects.prod_app
  folder_id       = module.prod_folder.folder_id
  billing_account = var.billing_account
}

module "prod_data_project" {
  source = "../../modules/project"

  name            = "Prod Data"
  project_id      = local.projects.prod_data
  folder_id       = module.prod_folder.folder_id
  billing_account = var.billing_account
}
