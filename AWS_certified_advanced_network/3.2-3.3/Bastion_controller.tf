resource "null_resource" "name" {
  depends_on = [module.Provider-bastion]
  # Connection Block for Provisioners to connect to EC2 Instance
  connection {
    type     = "ssh"
    host     = aws_eip.provider_eip.public_ip
    user     = "ec2-user"
    password = ""
    private_key = file("./Webkey.pem")
  }  

## File Provisioner: Copies the terraform-key.pem file to /tmp/terraform-key.pem
  provisioner "file" {
    source      = "./Webkey.pem"
    destination = "/tmp/Webkey.pem"
  }
## Remote Exec Provisioner: Using remote-exec provisioner fix the private key permissions on Bastion Host
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/Webkey.pem"
    ]
  }



}