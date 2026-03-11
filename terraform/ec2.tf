resource "aws_instance" "devops_server" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"
  key_name      = "devops-key"

  security_groups = [aws_security_group.devops_sg.name]

  tags = {
    Name = "DevOps-Server"
  }
}
