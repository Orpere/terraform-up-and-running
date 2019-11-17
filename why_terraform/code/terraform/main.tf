resource "aws_instance" "app" {
  instance_type     = "t2.micro"
  availability_zone = "us-east-2a"
  ami               = "ami-0b3192b6308bb1b49"
  vpc_security_group_ids = ["${aws_security_group.http-group.id}"]

  user_data = <<-EOF
              #!/bin/bash
              sudo service apache2 start
              EOF
}

resource "aws_security_group" "http-group" {
  name = "http-access"
  description = "Allow traffic on port 80 (HTTP)"

  tags = {
    Name = "HTTP Inbound Traffic Security Group"
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
}