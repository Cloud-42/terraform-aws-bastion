output "asg_id" {
  description = "Auto Scaling Group id"
  value       = aws_autoscaling_group.bastion.id
}
output "asg_name" {
  description = "Auto Scaling Name"
  value       = aws_autoscaling_group.bastion.name
}
