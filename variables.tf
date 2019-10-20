variable "private_tld" {
  default = "consul"
}

variable "region" {
  type = string
  default = ""
}

variable "domain_name" {
  type = string
}

variable "internal_domain_name" {
  type = string
}

//variable "environment" {}
variable "hostname" {
  default = "bastion"
}

variable "private_ip" {}
variable "public_ip" {
  type = string
  default = ""
}

variable "private_zone_id" {
  type = string
  default = ""
}

variable "public_zone_id" {
  type = string
  default = ""
}