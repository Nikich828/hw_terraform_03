data "yandex_compute_image" "ubuntu" {
  family = var.vm_family
}
resource "yandex_compute_instance" "web" {
  depends_on = [yandex_compute_instance.main_replica]
  
  count = var.counter_vm
  
  name        = "web-${count.index + 1}"
  hostname    = "${var.vpc_name}-web-${count.index + 1}"
  platform_id = var.common_platform
  zone        = var.default_zone
  
  resources {
    cores         = var.web_cores
    memory        = var.web_memory
    core_fraction = var.common_core_fraction
  }
  
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = var.web_disk_volume
    }
  }
  
  scheduling_policy {
    preemptible = var.preempt_on
  }
  
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.nat_on
    security_group_ids = [yandex_vpc_security_group.task_2.id]
  }
  
  metadata = local.metadata
}