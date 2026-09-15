output "subnets_by_zone" {
  description = "Map: зона → ID подсети"
  value = {
    (data.yandex_vpc_subnet.public.zone)  = data.yandex_vpc_subnet.public.id
    (data.yandex_vpc_subnet.private.zone) = data.yandex_vpc_subnet.private.id
  }
}
