resource "null_resource" "name" {
  depends_on = [module.bastion-instance]
  # Connection Block for Provisioners to connect to EC2 Instance
  connection {
    type     = "ssh"
    host     = aws_eip.eip.public_ip    
    user     = "ec2-user"
    password = ""
    private_key = file("./Webkey.pem")
  }  

## File Provisioner: Copies the terraform-key.pem file to /tmp/terraform-key.pem
  provisioner "file" {
    source      = "./hello.txt"
    destination = "/tmp/hello.txt"
  }
## Remote Exec Provisioner: Using remote-exec provisioner fix the private key permissions on Bastion Host
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/Webkey.pem"
    ]
  }
## Local Exec Provisioner:  local-exec provisioner (Creation-Time Provisioner - Triggered during Create Resource)
  # provisioner "local-exec" {
  #   command = "echo VPC created on `date` and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
  #   working_dir = "local-exec-output-files/"
  #   #on_failure = continue
  # }
}