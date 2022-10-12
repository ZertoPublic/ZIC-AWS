resource "aws_vpc" "vpc_zic" {
    cidr_block = "${var.vpc_zic_cidr}"
    enable_dns_hostnames = true
    enable_dns_support   = true

    tags = {
        Name = "${var.user-identifier}-vpc_zic"
    }
}
