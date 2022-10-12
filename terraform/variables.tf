variable "region" {
  default = "eu-west-2"
}

variable "zone_a" {
  default = "eu-west-2a"
}
variable "zone_b" {
  default = ""
}
variable "zone_c" {
  default = ""
}

variable "vpc_zic_cidr" {
  default = "172.33.0.0/16"
}

variable "user-identifier" {
  default = "staging"
}

variable "zic_subnet_01_cidr" {
    default = "172.33.64.0/20"
}

variable "zic_subnet_02_cidr" {
    default = "172.33.222.0/24"
}

variable "ec2_key_name" {
 default = "ZIC"
}

variable "account-id" {
  default = "XXXXXXXXXXXX"
}

variable "profile" {
 default = "default"
}