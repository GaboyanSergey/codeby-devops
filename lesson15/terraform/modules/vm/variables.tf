variable "vm_name" {
  description = "Имя ВМ"
  type        = string
  default     = "module-vm"
}

variable "zone" {
  description = "Зона, в которой создаётся ВМ"
  type        = string
  default     = "ru-central1-a"
}

variable "subnets_by_zone" {
  description = "Map: зона → ID подсети (из модуля subnets)"
  type        = map(string)
}

variable "platform_id" {
  description = "Платформа ВМ"
  type        = string
  default     = "standard-v3"
}

variable "cores" {
  description = "Количество vCPU"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Объём RAM (ГБ)"
  type        = number
  default     = 2
}

variable "disk_size" {
  description = "Размер диска (ГБ)"
  type        = number
  default     = 10
}

variable "image_family" {
  description = "Семейство образов"
  type        = string
  default     = "ubuntu-2204-lts"
}

variable "public_ip" {
  description = "Нужен ли публичный IP"
  type        = bool
  default     = true
}

variable "ssh_key_path" {
  description = "Путь к публичному SSH-ключу"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}


