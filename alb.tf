# alb.tf

resource "aws_alb" "cvs_dev_test_staging" {
  name            = "cvs-dev-test-staging"
  subnets         = aws_subnet.public.*.id
  security_groups = [aws_security_group.lb.id]

  depends_on = [aws_vpc.cvs_vpc, aws_security_group.lb, aws_subnet.public]
}

resource "aws_alb_target_group" "default_target_group" {
  name        = "default-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.cvs_vpc.id
  target_type = "ip"

  health_check {
    healthy_threshold   = "3"
    interval            = "30"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = "3"
    path                = "/"
    unhealthy_threshold = "2"
  }

  depends_on = [aws_vpc.cvs_vpc, aws_security_group.lb, aws_security_group.ecs_tasks]
}

resource "aws_alb_listener" "http_80" {
  load_balancer_arn = aws_alb.cvs_dev_test_staging.id
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.default_target_group.id
    type             = "forward"
  }

  depends_on = [aws_alb.cvs_dev_test_staging]
}

