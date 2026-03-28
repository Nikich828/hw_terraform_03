resource "yandex_compute_disk" "storage_disks" {
  count = var.disk_count
  name = "disk-${count.index + 1}"
  type = var.disk_type
  zone = var.default_zone
  size = var.disk_size
}
resource "yandex_compute_instance" "storage" {
  name        = var.storage_vm_name
  hostname    = var.storage_vm_name
  platform_id = var.common_platform
  zone        = var.default_zone
  resources {
    cores         = var.storage_vm_cores
    memory        = var.storage_vm_memory
    core_fraction = var.common_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = var.storage_vm_disk_size
    }
  }
  scheduling_policy {
    preemptible = var.preempt_on
  }
  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = var.nat_on
    security_group_ids = [yandex_vpc_security_group.task_2.id]
  }
  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.storage_disks.*.id
    content {
      disk_id = secondary_disk.value
    }
  }
  metadata = local.metadata
}