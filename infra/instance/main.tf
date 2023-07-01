resource "aws_instance" "master_k8s_instance" {
  ami = var.AMI
  tags = {
    Name = "master_k8s_instance"
  }
  instance_type = var.INSTANCE_TYPE
  subnet_id     = var.PUBLIC_SUBNET_ID

  vpc_security_group_ids = [aws_security_group.ssh-allowed.id]

  key_name = aws_key_pair.master_k8s_keypair.key_name

  depends_on = [
    aws_key_pair.master_k8s_keypair,
  ]

}


resource "aws_security_group" "ssh-allowed" {
  vpc_id = var.MAIN_VPC_ID
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = [var.EGRESS_CIDR]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.INGRESS_CIDER]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.INGRESS_CIDER]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.INGRESS_CIDER]
  }
  tags = {
    Name = "ssh-allowed"
  }
}



resource "tls_private_key" "tls_master_key" {
  algorithm   = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "master_k8s_keypair" {
  key_name = "master_k8s_keypair"
  public_key = tls_private_key.tls_master_key.public_key_openssh
  depends_on = [ tls_private_key.tls_master_key ]
}