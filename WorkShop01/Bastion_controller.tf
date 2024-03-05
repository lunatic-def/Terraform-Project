resource "null_resource" "name" {
  depends_on = [module.bastion-instance]
  # Connection Block for Provisioners to connect to EC2 Instance
  connection {
    type     = "ssh"
    host     = aws_eip.eip1.public_ip    
    user     = "ec2-user"
    password = ""
    private_key = file("./Webkey.pem")
  }  

## File Provisioner: Copies the terraform-key.pem file to /tmp/terraform-key.pem
  provisioner "file" {
    source      = "./Webkey.pem"
    destination = "/tmp/Webkey.pem"
  }

}