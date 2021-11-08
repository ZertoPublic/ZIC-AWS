//output "zic_ami_id" {
//  value = "${data.aws_ami.zic_ami.id}"
//}

output "zic_id" {
  value = "${aws_instance.zic.id}"
}



