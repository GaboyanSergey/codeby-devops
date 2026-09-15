variable "public_subnet_name" {
  description = "Имя публичной подсети"
  type        = string
  default     = "public-subnet"
}

variable "private_subnet_name" {
  description = "Имя приватной подсети"
  type        = string
  default     = "private-subnet"
}
