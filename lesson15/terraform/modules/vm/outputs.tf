output "vm_id" {
  description = "ID созданной ВМ"
  value       = yandex_compute_instance.this.id
}

output "vm_name" {
  description = "Имя созданной ВМ"
  value       = yandex_compute_instance.this.name
}

output "vm_public_ip" {
  description = "Публичный IP ВМ (если есть)"
  value       = yandex_compute_instance.this.network_interface[0].nat_ip_address
}

output "vm_private_ip" {
  description = "Внутренний IP ВМ"
  value       = yandex_compute_instance.this.network_interface[0].ip_address
}

output "vm_zone" {
  description = "Зона ВМ"
  value       = yandex_compute_instance.this.zone
}
