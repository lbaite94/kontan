resource "aws_security_group" "kontan_stack-sg" {
  vpc_id = aws_vpc.kontan.id
  name = "kontan-stack-sg"
  description = "Security Group for kontan ssh"
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "var.MYIP" ]
  }
  tags = {
    Name = "allow-ssh"
  }
}
