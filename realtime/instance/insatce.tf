resource "aws_instance" "vm1" {
ami = var.ami_id
instance_type = var.itype
count = var.icount

tags = {
Name = "${var.iname}-${count.index + 1}"
}
}


