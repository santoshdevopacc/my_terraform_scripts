resource "aws_instance" "svr1" {
ami = "ami-0720cb7af233b0529"
instance_type = "t3.micro"
tags = {
Name = var.iname[count.index]
}
count = 2
}

variable "iname" {
type = list(string)
default = ["server1", "server2"]
}
