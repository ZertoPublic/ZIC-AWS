resource "aws_route_table" "rtb-zic_public" {
  vpc_id = "${var.vpc_zic_id}"
      tags = {
        Name = "${var.user-identifier}-rtb-zic_public"
    }  
}

resource "aws_route" "zic_public_route" {
  route_table_id         = "${aws_route_table.rtb-zic_public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.igw_zic.id}"
}

resource "aws_main_route_table_association" "zic_public_route_a" {
  vpc_id         = "${var.vpc_zic_id}"
  route_table_id = "${aws_route_table.rtb-zic_public.id}"
}