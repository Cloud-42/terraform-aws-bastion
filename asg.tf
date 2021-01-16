# --------------------------
# Bastion Auto-Scaling Group
# --------------------------
resource "aws_autoscaling_group" "bastion" {
  name                      = "${var.environment}_bastion_asg"
  max_size                  = var.max_size
  min_size                  = var.min_size
  desired_capacity          = var.desired_capacity
  launch_configuration      = aws_launch_configuration.bastion.name
  vpc_zone_identifier       = var.vpc_zone_identifier
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type

  dynamic "tag" {
    for_each = var.tags

    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }

  dynamic "instance_refresh" {
    for_each = var.instance_refresh

    content {
      strategy = instance_refresh.key
      triggers = each.instance_refresh.triggers
    }
  }
}
