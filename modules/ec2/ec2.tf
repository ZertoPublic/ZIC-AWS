data "aws_ami" "zic_ami" {
  most_recent = true
  owners = ["632738139297"]

  filter {
    name = "name"
    values = ["zAppliance-*"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}


resource "aws_instance" "zic" {
  ami = "${data.aws_ami.zic_ami.id}"
  instance_type = "m5.xlarge"
  disable_api_termination = false
  associate_public_ip_address = true
  private_ip = "172.33.64.20"
  subnet_id = "${var.zic_subnet_01_id}"
  vpc_security_group_ids = ["${var.sg_pub_zic_id}"]
  key_name = "${var.ec2_key_name}"
  iam_instance_profile = "${var.user-identifier}-iam_role_zic"  // See zic.tf line: 7

      tags = {
        Name = "${var.user-identifier}-zic"
    }  
}