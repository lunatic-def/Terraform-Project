# Get latest AMI ID for Amazon Linux2023 OS
data "aws_ami" "amzlinux2023" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "ami-*" ]
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}