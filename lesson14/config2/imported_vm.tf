resource "yandex_compute_instance" "imported_vm" {
  name        = "imported-vm"
  platform_id = "standard-v3"
  zone        = var.yc_zone

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd85n2sh0jr400ph4b8u"
      size     = 10
    }
  }

  network_interface {
    subnet_id = "e9b07y3rd9crkb1r224ki"
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}
