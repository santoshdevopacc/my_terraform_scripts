resource "aws_security_group" "SG1" {
  name        = "sgone"
  description = "this securitygroup 1"

  ingress {
    from_port    = 0
    to_port      = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
