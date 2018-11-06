#
# The module is usually called from a
# top level repository.
#
module "bastion" {
  source = "git::https://github.com/Cloud-42/terraform-aws-bastion.git"

  environment         = "prod"
  key_name            = "ec2_key"
  image_id            = "${data.aws_ami.ubuntuserver_ami_useast1.id}"
  orchestration       = "https://github.com/build"
  vpc_zone_identifier = "subnet-xyxyxyx"
  security_groups     = "sg-xyxyxyxyzz"
  dns_domain_name     = "prod.domain.io"
  hosted_zone_id      = "XYXYJ44DTY4JS"

  #
  # Setup notifications
  #
  notifications = "true"

  alarm_topic_arn = "arn:aws:sns:us-east-1:123456789:notify"
}
