provider "aws" {
    shared_credentials_file = "~/.aws/credentials"
    profile  = "${var.profile}"
    region   = "${var.region}"
}

module "iam" {
  source  = "./modules/iam"
  region = "${var.region}" 
  account-id  = "${var.account-id}" 
  user-identifier  = "${var.user-identifier}"
  vpc_zic_id       = "${module.vpc.vpc_zic_id}"
}

module "ec2" {
  source  = "./modules/ec2"
  ec2_key_name  = "${var.ec2_key_name}"
  zone_a    = "${var.zone_a}"
  zone_b    = "${var.zone_a}"
  zone_c    = "${var.zone_c}"
  user-identifier    = "${var.user-identifier}"
  vpc_zic_id         = "${module.vpc.vpc_zic_id}"
  
  zic_subnet_01_id   = "${module.vpc.zic_subnet_01_id}"
  zic_subnet_02_id   = "${module.vpc.zic_subnet_02_id}" 

  sg_pub_zic_id  = "${module.security_groups.sg_pub_zic_id}" 
  sg_int_zic_id  = "${module.security_groups.sg_int_zic_id}"
  }

module "vpc" {
  source  = "./modules/vpc"
  zone_a  = "${var.zone_a}"
  zone_b  = "${var.zone_b}"
  zone_c  = "${var.zone_c}"
  user-identifier     = "${var.user-identifier}"
  
  vpc_zic_cidr        = "${var.vpc_zic_cidr}"
  zic_subnet_01_cidr  = "${var.zic_subnet_01_cidr}"
  zic_subnet_02_cidr  = "${var.zic_subnet_02_cidr}"
  }

module "security_groups"  {
  source          = "./modules/security_groups"
  user-identifier = "${var.user-identifier}"
  vpc_zic_id      = "${module.vpc.vpc_zic_id}"
  }

