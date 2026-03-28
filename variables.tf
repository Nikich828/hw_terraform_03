###cloud vars
variable "cloud_id" {
  type        = string
  default     = "b1gsv0iedv4orkas8lug"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1gjbqa87bvhrtjk7g6e"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "vm_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "ubuntu version"
}

variable "common_platform" {
  type        = string
  default     = "standard-v1"
  description = "Common platform for all VMs"
}

variable "common_core_fraction" {
  type        = number
  default     = 20
  description = "Common core fraction for all VMs"
}

variable "preempt_on" {
  type        = bool
  default     = true
  description = "Preemptible instances"
}

variable "nat_on" {
  type        = bool
  default     = true
  description = "NAT for instances"
}

### task_2
variable "each_vm" {
  type = list(object({
    vm_name     = string
    cpu         = number
    ram         = number
    disk_volume = number
  }))
  description = "Parameters for database VMs"
  default = [
    {
      vm_name     = "main"
      cpu         = 2
      ram         = 4
      disk_volume = 20
    },
    {
      vm_name     = "replica"
      cpu         = 2
      ram         = 2
      disk_volume = 15
    }
  ]
}

variable "counter_vm" {
  type        = number
  default     = 2
  description = "Number of web VMs"
}

variable "web_cores" {
  type        = number
  default     = 2
  description = "Number of cores for web VMs"
}

variable "web_memory" {
  type        = number
  default     = 2
  description = "Memory for web VMs"
}

variable "web_disk_volume" {
  type        = number
  default     = 10
  description = "Disk volume for web VMs"
}

variable "disk_count" {
  type        = number
  description = "Number of additional disks"
  default     = 3
}

variable "disk_size" {
  type        = number
  description = "Size of additional disks in GB"
  default     = 1
}

variable "disk_type" {
  type        = string
  description = "Type of disks"
  default     = "network-hdd"
}

###  task_3
variable "storage_vm_name" {
  type        = string
  description = "Storage VM name"
  default     = "storage"
}

variable "storage_vm_cores" {
  type        = number
  description = "Storage VM cores"
  default     = 2
}

variable "storage_vm_memory" {
  type        = number
  description = "Storage VM memory"
  default     = 2
}

variable "storage_vm_disk_size" {
  type        = number
  description = "Storage VM boot disk size"
  default     = 10
}