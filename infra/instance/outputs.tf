output "INSTANCE_PUBLIC_IP" {
  description = "Public IP addresses of the EC2 instances"
  value       = {
    for instance_name in var.MASTER_NODES : instance_name => aws_instance.master_k8s_instance[instance_name].public_ip
  }
}

output "PRIVATE_KEY_PEM" {
  value = tls_private_key.tls_master_key.private_key_pem
  sensitive = true
  #depends_on = [ aws_key_pair.aws_key_pair.master_k8s_keypair ]
}