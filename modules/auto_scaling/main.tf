resource "aws_autoscaling_group" "web" {
  name                = "${var.project}-asg"

  min_size            = 0
  max_size            = 3
  desired_capacity    = 1

  vpc_zone_identifier = var.subnets
  target_group_arns   = var.target_group_arn

  launch_template {
    id      = var.launch_template_id
    version = var.launch_template_version
  }

  # Add tags to the instances.
  tags = [
    {
      key                 = "Name"
      value               = "${var.instances_name}-server"
      propagate_at_launch = true
    }
  ]
}