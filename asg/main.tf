resource "aws_launch_template" "lt1" {
  name                   = "sydney-lt"
  description            = "sydenyservers"
  image_id               = "ami-0720cb7af233b0529"
  instance_type          = "t3.micro"
  key_name               = "devopkey_1"
  vpc_security_group_ids = [aws_security_group.sg1.id]

  placement {
    availability_zone = "ap-southeast-2a"
  }

  user_data = base64encode(<<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl start httpd
    sudo systemctl enable httpd
    sudo chmod 766 /var/www/html/index.html
    sudo echo "<html><body><h1>Autoscaling with terraform.</h1></body></html>" > /var/www/html/index.html
  EOF
  )
}

resource "aws_elb" "elb1" {
  name            = "sydney-lb"
  subnets         = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
  security_groups = [aws_security_group.sg1.id]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
}

resource "aws_autoscaling_group" "asg1" {
  name                = "sydney-asg"
  min_size            = 2
  max_size            = 6
  desired_capacity    = 2
  health_check_type   = "EC2"
  load_balancers      = [aws_elb.elb1.name]
  vpc_zone_identifier = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
}

launch_template {
    id      = aws_launch_template.lt1.id
    version = "$Latest"
  }
}
