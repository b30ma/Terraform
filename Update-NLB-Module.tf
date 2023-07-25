locals{
  variable "instance_ids" {
  type    = list(string)
  default = []  # Pass a list of instance IDs or tags when calling this module
  }

}

provider "aws" {
  region = "us-west-2"  # Replace with your desired AWS region
}

# Existing NLB and Target Group definitions (use your actual resource names)
resource "aws_lb" "network_load_balancer" {
  name               = "my-nlb"
  internal           = false
  load_balancer_type = "network"
  subnets            = ["subnet- < >", "subnet- < >"]  # Replace with your subnet IDs
}

resource "aws_lb_target_group" "instance_target_group" {
  name     = "my-instance-target-group"
  port     = 80
  protocol = "TCP"
  vpc_id   = "vpc- < > "  # Replace with your VPC ID

  health_check {
    enabled             = true
    interval            = 30  # Adjust to your desired interval
    path                = "/health-check"  # Replace with your health check path
    port                = 80  # Replace with your health check port
    protocol            = "HTTP"
    timeout             = 5   # Adjust to your desired timeout
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = "< >"  # Use appropriate HTTP response codes based on your application
  }
}

# New resource to define instances (assuming you have instance IDs or tags)
resource "aws_lb_target_group_attachment" "instance_attachments" {
  count = length(local.var.instance_ids)  # Pass a list of instance IDs as a variable (var.instance_ids) to this module.

  target_group_arn = aws_lb_target_group.instance_target_group.arn
  target_id        = localvar.instance_ids[count.index]
}
