# AWS EC2 Instance Terraform Outputs
# Public EC2 Instances - Bastion Host

# ec2_bastion_public_instance_ids
# output "ec2_bastion_public_instance_ids" {
#   description = "EC2 instance ID"
#   value = [for Webserver in module.Webserver: Webserver.id ] 
# }
# output "ec2_bastion_public_instance_ids2" {
#   description = "EC2 instance ID"
#   value       = aws_autoscaling_group.my_asg.
# }

# ## ec2_bastion_public_ip
# output "provider_public_ip" {
#   description = "Public IP address EC2 instance"
#   value       = aws_eip.provider_eip.public_ip
# }
# # Private EC2 Instances
# ## ec2_private_instance_ids
# output "ec2_private_instance_ids" {
#   description = "List of IDs of instances"
#   value = [for private-instances in module.private-instances: private-instances.id ]   
# }

# ## ec2_private_ip
# output "ec2_private_ip" {
#   description = "List of private IP addresses assigned to the instances"
#   value = [for private-instances in module.private-instances: private-instances.private_ip ]  
# }