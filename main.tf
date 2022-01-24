resource "aws_instance" "my_server" {
  ami = "ami-0fdbd8587b1cf431e"

  instance_type = var.instance_type

  security_groups = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "MyServer"
  }
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic from a single 212.3.197.246"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    description      = "SSH from my IP"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["212.3.197.246/32"]
    ipv6_cidr_blocks = []
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}