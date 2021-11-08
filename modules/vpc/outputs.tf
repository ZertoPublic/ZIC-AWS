output "vpc_zic_id" {
    value = "${aws_vpc.vpc_zic.id}"
}

output "zic_subnet_01_id" {
      value =  "${aws_subnet.zic_subnet_01.id}"
}

output "zic_subnet_02_id" {
      value =  "${aws_subnet.zic_subnet_02.id}"
}
