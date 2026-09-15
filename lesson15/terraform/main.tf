module "subnets" {
  source = "./modules/subnets"

  public_subnet_name  = "public-subnet"
  private_subnet_name = "private-subnet"
}

module "vm" {
  source = "./modules/vm"

  vm_name        = var.vm_name
  zone           = var.yc_zone
  subnets_by_zone = module.subnets.subnets_by_zone
  public_ip      = true
  ssh_key_path   = "~/.ssh/id_rsa.pub"
}

output "subnets_map" {
  value       = module.subnets.subnets_by_zone
}

output "vm_public_ip" {
  value       = module.vm.vm_public_ip
}
