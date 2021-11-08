//data "aws_ami" "zic_ami" {
//  most_recent = true
//  owners = ["self"]

//  filter {
//    name = "name"
//    values = ["zAppliance-1.1.0"]
//  }
//  filter {
//    name = "virtualization-type"
//    values = ["hvm"]
//  }
//}


//resource "aws_eip" "zic_eip" {
  //instance = "${aws_instance.zic.id}"
//  network_interface = "${aws_network_interface.zic_dynamic.id}"
//  vpc = true
//  lifecycle {
//    create_before_destroy = true
//  }

//        tags = {
//        Name = "${var.user-identifier}-zic_eip"
//    }
//}

//resource "aws_network_interface" "zic_dynamic" {
//  subnet_id       ="${var.zic_subnet_01_id}"
//  security_groups = ["${var.sg_pub_zic_id}"]

//        tags = {
//        Name = "${var.user-identifier}-zic_dynamic"
//    }
//}

resource "aws_instance" "zic" {
  //ami = "${data.aws_ami.zic_ami.id}"
  ami = "ami-06e6d8cdd15b4c655"
  instance_type = "m5.xlarge"
  disable_api_termination = true
  associate_public_ip_address = true
  subnet_id = "${var.zic_subnet_01_id}"
  private_ip = "172.33.64.20"
  vpc_security_group_ids  = ["${var.sg_pub_zic_id}"]
  key_name                = "${var.ec2_key_name}"
  iam_instance_profile = "${var.user-identifier}-iam_role_zic"  // See zic.tf line: 7

//  network_interface {
//    network_interface_id = "${aws_network_interface.zic_dynamic.id}"
//    device_index         = 0
//  }

      tags = {
        Name = "${var.user-identifier}-zic"
    }  
}