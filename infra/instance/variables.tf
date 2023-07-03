variable "AMI" {
  description = "AMI"
}

variable "PUBLIC_SUBNET_ID" {
  type = string
}

variable "MAIN_VPC_ID" {
  type = string
}

variable "EGRESS_CIDR" {
  type = string
}

variable "INGRESS_CIDER" {
  type = string
}


variable "MASTER_NODES" {
  type = list(string)
  default = []
}

variable "MASTER_INSTANCE_TYPE" {
  type        = string
  description = "instance_type"
}

variable "CONTROLLER_NODES" {
  type = list(string)
  default = []
}

variable "CONTROLLER_INSTANCE_TYPE" {
  type        = string
  description = "controller instance type"
}