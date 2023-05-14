module "vnet" {
  source = "../modules/net"
  name   = "test"
  domain = "test.kvm"
  subnet = "192.168.128.0/24"
}


module "vm" {
  source            = "../modules/vm"
  cloudimage        = pathexpand("")
  cloudimage_format = "qcow2"
  name              = "test"
  network           = "test"
  vcpu              = 1
  memory            = 256
  vcpu_model_host   = true
  user_data         = file("${path.module}/user-data.cfg")
}

output "ips" {
  value = module.vm.ips
}


variable "cloudimage" {
  description = "Path to cloud image"
}
