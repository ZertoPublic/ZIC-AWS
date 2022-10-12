resource "aws_internet_gateway" "igw_zic" {
    vpc_id = "${var.vpc_zic_id}"
    tags = {
        Name = "${var.user-identifier}-igw_zic"
    }
}