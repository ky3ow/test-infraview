resource "aws_security_group" "infraview" {
  name        = "infraview-demo"
  description = "Allow SSH and InfraView HTTP"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "InfraView HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
