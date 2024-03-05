# Launch Template Resource
resource "aws_launch_template" "my_launch_template" {
  name = "launch-template"
  description = "My Launch Template"
  image_id = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type

  vpc_security_group_ids = [module.private-secgroup.security_group_id]
  key_name = var.instance_keypair  
  #user_data = filebase64("${path.module}/script.sh")
  user_data = base64encode(templatefile("${path.module}/script.tmpl",{rds_db_endpoint = module.master.db_instance_address}))
  #user_data =  templatefile("script.tmpl",{rds_db_endpoint = module.master.db_instance_address})   
  ebs_optimized = false # not support for t2.micro/ t3.micro uwu
  #default_version = 1
  update_default_version = true
#   block_device_mappings {
#     device_name = "/dev/sda1"
#     ebs {
#       volume_size = 10    
#       delete_on_termination = true
#       volume_type = "gp2" # default is gp2
#      }
#   }
  monitoring {
    enabled = false
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "private_instance"
    }
  }
}