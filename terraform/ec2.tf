provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_instance" "devacc" {
  ami           = "ami-0eeab0e1473986ffd"
  instance_type = "t3.micro"
  key_name      = "devopkey_1"
  count         = 1

  tags = {
    Name = "${terraform.workspace}-server"
  }

  root_block_device {
    volume_size = 10
  }
}

output "abc" {
  value = [aws_instance.devacc[*].public_ip, aws_instance.devacc[*].id]
}
