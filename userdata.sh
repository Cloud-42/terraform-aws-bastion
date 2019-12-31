#!/bin/sh
#
# Vars
#
AWS_REGION=${region}
#
# Setup AWSCLI
# Assumption is that awscli is available via yum repo.
#
yum install awscli -y
#
# Setup DNS record update
#
PUBLICIP=$(curl -s 'http://169.254.169.254/latest/meta-data/public-ipv4')
cat << EOF > /root/dns_update.json
{"Comment": "Bastion DNS record update","Changes":[{"Action":"UPSERT","ResourceRecordSet":{"Name":"${hostname}.${dns_domain_name}","Type":"A","TTL":300,"ResourceRecords":[{"Value":"$PUBLICIP"}]}}]}
EOF
#
# Update DNS record
#
aws route53 change-resource-record-sets --hosted-zone-id ${hosted_zone_id} --change-batch file:///root/dns_update.json
#
# Set hostname
#
hostname ${hostname}.${dns_domain_name}
hostnamectl set-hostname ${hostname}.${dns_domain_name}
#
# Install CodeDeploy agent
#
yum install -y ruby
wget https://aws-codedeploy-$AWS_REGION.s3.amazonaws.com/latest/install
chmod +x ./install
./install auto
#
# Patch host
#
yum update -y
