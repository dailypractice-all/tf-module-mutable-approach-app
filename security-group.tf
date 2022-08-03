resource "aws_security_group" "private-sg" {
  name        = "${local.TAG_PREFIX}-private-sg"
  description = "${local.TAG_PREFIX}-private-sg"
  vpc_id      = var.VPC_ID
  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "TCP"
    cidr_blocks      = var.ALLOW_SG_CIDR
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.TAG_PREFIX}-private-sg"
  }
}

resource "aws_security_group" "public-sg" {
  name        = "${local.TAG_PREFIX}-public-sg"
  description = "${local.TAG_PREFIX}-public-sg"
  vpc_id      = var.VPC_ID

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "TCP"
    cidr_blocks      = v["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.TAG_PREFIX}-public-sg"
  }
}