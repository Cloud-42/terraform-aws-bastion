variable "region" {
  type        = string
  description = "AWS region"
}

variable "alarm_topic_arn" {
  type        = string
  description = "Topic ARN to send ASG event notifcations to"
  default     = null
}

variable "notifications" {
  type        = bool
  description = "Enable / Disable ASG Event notifications"
  default     = false
}

variable "hosted_zone_id" {
  type        = string
  description = "Variable for Hosted zone id, eg Z2XXOVXYYGMD12"
}

variable "health_check_grace_period" {
  type        = number
  description = "Health check Grace period for ASG"
  default     = 120
}

variable "health_check_type" {
  type    = string
  default = "EC2"
}

variable "hostname" {
  type    = string
  default = "bastion"
}

variable "dns_domain_name" {
  type        = string
  description = "DNS domain name the host will be part of. eg dev.domain.io"
}

variable "ebs_optimized" {
  type        = bool
  description = "Sets ebs optimised for ec2 instance if required"
  default     = true
}

variable "environment" {
  type        = string
  description = "The environment the Bastion will be part of, eg, DEV, UAT or PROD"
}

variable "key_name" {
  type        = string
  description = "SSH Key used to build the host"
}

variable "enable_monitoring" {
  type        = bool
  description = "Enables / disables detailed monitoring"
  default     = false
}

variable "instance_type" {
  type        = string
  description = "ec2 instance type"
  default     = "t3a.micro"
}

variable "image_id" {
  type        = string
  description = "AMI to use"
}

variable "volume_type" {
  type        = string
  description = "ec2 volume type"
  default     = "gp2"
}

variable "max_size" {
  type        = number
  description = "ASG maximum size"
  default     = 1
}

variable "min_size" {
  type        = number
  description = "ASG minimum size"
  default     = 1
}

variable "desired_capacity" {
  type        = number
  description = "ASG desired size"
  default     = 1
}

variable "volume_size" {
  type        = number
  description = "instance Volume size"
  default     = 10
}

variable "security_groups" {
  type        = string
  description = "Security Group to associate with the ec2 instance"
}

variable "vpc_zone_identifier" {
  type        = list(string)
  description = "A list of subnet IDs to launch the Bastion in"
}

variable "iam_policies" {
  type        = map(string)
  description = "List of additional IAM policies to assign to the Bastion"
  default     = {}
}

variable "tags" {
  description = "Tags to assign"
  type        = map(string)
  default     = {}
}

variable "encrypted" {
  type        = bool
  description = "Encrypt root volume"
  default     = true
}

variable "custom_userdata" {
  description = "Set custom userdata"
  type        = string
  default     = ""
}

variable "instance_refresh" {
  description = "Instance refresh option"
  type        = any
  default     = {}
}
