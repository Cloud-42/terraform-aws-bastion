#
# Define outputs
#

output "asg_id" {
  description = "Auto Scaling Gorup id"
  value = "${aws_autoscaling_group.bastion.id}"
}
