resource "aws_instance" "my_server" {
  ami = "ami-0fdbd8587b1cf431e"

  instance_type = var.instance_type

  tags = {
    Name = "MyServer"
  }
}