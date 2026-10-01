resource "aws_instance" "inc1" {
ami = "ami-0720cb7af233b0529"
instance_type = "t3.micro"
tags = {
Name = "server1"
}
}

