resource "aws_security_group" "sg1" {
  name        = "sydney-sg"
  description = "allw all"

  dynamic "ingress" {
    for_each = var.ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

variable "ports" {
  type    = list(any)
  default = [22, 80, 3306, 8080, 21]
}
