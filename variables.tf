variable "resource_group" {
  type = object(
    {
      name     = string
      location = string
    }
  )
  default = {
    name     = "afs01"
    location = "North Europe"
  }
}

variable "cluster" {
  type = object(
    {
      name = string
      vm_size = string
      node_count = number
      os_disk_size = number
    }
  )
  default = {
    name = "development"
    vm_size = "Standard_D2_v2"
    node_count = 2
    os_disk_size = 30
  }
}

variable "virtual_network" {
  type = object(
    {
      address_space = list(string)
    }
  )

  default = {
    address_space = ["10.0.0.0/22"]
  }
}


variable "tags" {
  default = {
    environment = "dev"
  }
}
