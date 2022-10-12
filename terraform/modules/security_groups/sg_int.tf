resource "aws_security_group" "sg_int_zic" {
  name   = "${var.user-identifier}-sg_int_zic"
  description = "${var.user-identifier}-sg_int_zic"
  vpc_id      = "${var.vpc_zic_id}"

    tags = {
        Name = "${var.user-identifier}-sg_int_zic"
    }


  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = 6
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22 
    to_port     = 22
    protocol    = 6
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
