resource "aws_security_group" "sg1" {
name = var.sg_name
description = "allow all"

ingress {
from_port = 0
to_port = 0
protocol = "TCP"
cidr_blocks = ["0.0.0.0/0"]
}

egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
}

