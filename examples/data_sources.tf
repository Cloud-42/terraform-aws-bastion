# ---------------------------------------------------
# Find latest Ubuntu AMI in US-EAST-1
# ---------------------------------------------------
data "aws_ami" "ubuntuserver_ami_useast1" {
  most_recent = true

  #
  # 099720109477 - https://www.canonical.com/
  # Beware of using anything other than this
  #
  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }
}
