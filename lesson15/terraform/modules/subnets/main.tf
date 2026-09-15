terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

data "yandex_vpc_subnet" "public" {
  name = var.public_subnet_name
}

data "yandex_vpc_subnet" "private" {
  name = var.private_subnet_name
}
