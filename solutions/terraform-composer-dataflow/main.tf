
terraform {
  required_version = ">= 0.14.3"

  required_providers {
    google = {
      version = "~> 3.31"
    }

    google-beta = {
      version = "~> 3.31"
    }
  }

  backend "gcs" {
    bucket = "datatonic-devops-play-tfstate"
    prefix = "terraform-template/state"
  }
}

module "simple-composer-environment" {
  source               = "../../modules/composer"
  project_id           = var.project_id
  composer_env_name    = var.composer_env_name
  node_count           = var.node_count
  region               = var.region
  zone                 = var.zone
  composer_private_env = var.composer_private_env
  node_config          = var.node_config
  software_config      = var.software_config
  network              = module.networking.vpc
  subnetwork           = module.networking.subnet
  service_account      = module.project_level_iam.composer_sa
  depends_on           = [module.networking, module.project_level_iam]
}

module "networking" {
  source                          = "../../modules/networking"
  project_id                      = var.project_id
  region                          = var.region
  zone                            = var.zone
  vpc_name                        = var.vpc_name
  auto_create_subnetworks         = var.auto_create_subnetworks
  routing_mode                    = var.routing_mode
  delete_default_routes_on_create = var.delete_default_routes_on_create
  subnet_name                     = var.subnet_name
  cidr_range                      = var.cidr_range

}

module "project_level_iam" {
  source       = "../../modules/project_level_iam"
  project_id   = var.project_id
  account_id   = var.account_id
  display_name = var.display_name
}



resource "null_resource" "upload_composer_dag" {

 triggers = {

   file_hashes = jsonencode({

   for file in fileset(var.folder_path, "**") :

   file => filesha256("${var.folder_path}/${file}")

   })
 }

 provisioner "local-exec" {

   command = "gsutil -m rsync -d -r ${var.folder_path} ${module.simple-composer-environment.dag_gcs}/"

 }
  depends_on = [module.simple-composer-environment]
}
