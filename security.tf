
# ALB Security Group: Edit to restrict access to the application
resource "aws_security_group" "lb" {
  name        = "cvs-example-alb"
  description = "controls access to the ALB"
  vpc_id      = aws_vpc.cvs_vpc.id

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
    # prevent_destroy = true
    ignore_changes = [
      name,
      tags,
    ]
  }
}

# Traffic to the ECS cluster should only come from the ALB
resource "aws_security_group" "ecs_tasks" {
  name        = "cvs-test-staging-ecs"
  description = "allow inbound access from the ALB only"
  vpc_id      = aws_vpc.cvs_vpc.id

  ingress {
    protocol        = "tcp"
    from_port       = 8080
    to_port         = 8080
    security_groups = [aws_security_group.lb.id]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
    # prevent_destroy = true
    ignore_changes = [
      # Ignore changes to tags, e.g. because a management agent
      # updates these based on some ruleset managed elsewhere.
      name,
      tags,
    ]
  }

  depends_on = [aws_security_group.lb]
}
