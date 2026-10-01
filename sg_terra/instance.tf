provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_instance" "s1" {
  tags = {
    Name = "server1"
  }

  ami                    = "ami-0fe65665c4d6f0de7"
  instance_type          = "t3.micro"
  key_name               = "devopkey_1"
  availability_zone      = "ap-southeast-2a"
  count                  = 1
  vpc_security_group_ids = [aws_security_group.SG1.id]
  root_block_device {
    volume_size = 10
  }

}
