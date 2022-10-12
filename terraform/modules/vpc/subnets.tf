resource "aws_subnet" "zic_subnet_01" {
    vpc_id = "${aws_vpc.vpc_zic.id}"
    cidr_block = "${var.zic_subnet_01_cidr}"
    availability_zone ="${var.zone_a}"
    
    tags = {
        Name = "${var.user-identifier}-zic_subnet_01"
    }
}

resource "aws_subnet" "zic_subnet_02" {
    vpc_id = "${aws_vpc.vpc_zic.id}"
    cidr_block = "${var.zic_subnet_02_cidr}"
    availability_zone ="${var.zone_a}"
    
    tags = {
        Name = "${var.user-identifier}-zic_subnet_02"
    } 
}
