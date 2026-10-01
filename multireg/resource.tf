resource "aws_instance" "svrsyd1" {

  tags = {
    Name = "sydney_server"
  }

  ami           = "ami-0eeab0e1473986ffd"
  instance_type = "t3.micro"

}

resource "aws_instance" "svrsing1" {
  provider = "aws.devopacc"
  tags = {
    Name = "singapore_server"
  }

  ami           = "ami-095f155a67469a548"
  instance_type = "t3.micro"
}
