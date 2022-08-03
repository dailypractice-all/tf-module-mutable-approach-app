resource "aws_lb" "private" {
  name               = "${var.PROJECT}-${var.ENV}-alb-private"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.private-sg.id]
  subnets            = var.PRIVATE_SUBNET_IDS

  tags = {
    Environment = "${var.PROJECT}-${var.ENV}-alb-private"
  }
}