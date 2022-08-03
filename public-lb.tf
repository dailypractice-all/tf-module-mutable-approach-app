resource "aws_lb" "public" {
  name               = "${var.PROJECT}-${var.ENV}-alb-public"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.public-sg.id]
  subnets            = var.PUBLIC_SUBNET_IDS

  tags = {
    Environment = "${var.PROJECT}-${var.ENV}-alb-public"
  }
}