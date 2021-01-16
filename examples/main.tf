resource "aws_route53_zone" "prd" {
  name = "prd.digital.com"
}

module "bastion" {
  source = "git::https://github.com/Cloud-42/terraform-aws-bastion.git"

  environment         = var.env
  key_name            = var.env
  image_id            = data.aws_ami.latest_amazon_linux_ami.id
  vpc_zone_identifier = module.vpc.public_subnets
  security_groups     = "sg-12211120e9470ceeb3"
  dns_domain_name     = aws_route53_zone.prd.name
  hosted_zone_id      = aws_route53_zone.prd.zone_id
  region              = var.region

  iam_policies = {
    policy1 = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
    policy2 = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
  }

  tags = merge(var.tags, { "Name" = "bastion" })
}

