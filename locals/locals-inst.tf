provider "aws" {
region = "ap-southeast-2"
}

locals {
abc = {
dev = "t3.micro"
test = "t3.small"
prod = "c7i-flexi.large"
}
}

resource "aws_instance" "inst1"{
ami ="ami-0720cb7af233b0529"
instance_type = local.abc[terraform.workspace]
tags = {
Name = "${terraform.workspace}-server"
}
}
