resource "aws_eip" "EIP" {
  domain = "vpc"
  #network_interface         = aws_network_interface.NetworkEIP.id
  depends_on = [module.vpc, module.bastion-instance] # waint for the creation of VPC and EC2 first

  instance = module.bastion-instance.id # assign to bastion instance
  tags = { name = "EIP"}
   

   ## Local Exec Provisioner:  local-exec provisioner (Destroy-Time Provisioner - Triggered during deletion of Resource)
  provisioner "local-exec" {
    command = "echo Destroy time prov `date` >> destroy-time-prov.txt"
    working_dir = "local-exec-output-files/"
    when = destroy
    #on_failure = continue
  }
}