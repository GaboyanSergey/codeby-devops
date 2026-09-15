variable "yc_cloud_id" {
  description = "Cloud ID"
  type        = string
}

variable "yc_folder_id" {
  description = "Folder ID"
  type        = string
}

variable "yc_zone" {
  description = "Zone"
  type        = string
  default     = "ru-central1-a"
}

variable "vpc_id" {
  description = "ID существующей VPC"
  type        = string
}

variable "vm_name" {
  description = "Имя создаваемой ВМ"
  type        = string
  default     = "module-vm"
}
