# Root module — calls a child module (reusable package of resources).

module "app_config" {
  source = "./modules/config"

  app_name    = "web"
  environment = "dev"
}

output "config_path" {
  value = module.app_config.file_path
}

output "config_id" {
  value = module.app_config.config_id
}
