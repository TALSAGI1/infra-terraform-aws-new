resource "aws_security_group" "this" {
  name   = var.name
  vpc_id = var.vpc_id
  description = "Allow inbound traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = var.name }
}

output "sg_id" { value = aws_security_group.this.id }
