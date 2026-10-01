resource "aws_instance" "s1" {
  tags = {
    Name = var.iname
  }

  ami               = var.ami-id
  instance_type     = "t3.micro"
  key_name          = "devopkey_1"
  availability_zone = "ap-southeast-2a"
  count             = var.icount

  root_block_device {
    volume_size = 10
  }

}
