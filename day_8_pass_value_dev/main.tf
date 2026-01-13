module "dev_module" {
  source = "../day_8_modules"
  ami_id = var.ami_id
  type = var.type
  name = var.server_name
}