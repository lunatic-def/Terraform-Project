
resource "aws_eip" "eip1" {
  depends_on = [ module.bastion-instance, module.vpc]
  tags = {name="eip1"}

  instance = module.bastion-instance.id
  domain = "vpc"
}
