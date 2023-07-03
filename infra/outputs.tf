output "INSTANCE_PUBLIC_IP_OUTPUT_MODULE" {
  value = module.instance_module.INSTANCE_PUBLIC_IP
}

output "PRIVATE_KEY_PEM" {
  value = module.instance_module.PRIVATE_KEY_PEM
  sensitive = true
}