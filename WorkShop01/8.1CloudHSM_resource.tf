# #create cluster
# resource "aws_cloudhsm_v2_cluster" "cloudhsm_v2_cluster" {
#   hsm_type   = "hsm1.medium"
#   subnet_ids = module.vpc.private_subnets
#   #security group cannot be define before create so it much manually config

#   tags = {
#     Name = "aws_cloudhsm_v2_cluster"
#   }
# }
# #Create 1 hsm in subnet (10.0.1.0/24)
# resource "aws_cloudhsm_v2_hsm" "cloudhsm_v2_hsm" {
#   subnet_id  = module.vpc.private_subnets[0]
#   cluster_id = aws_cloudhsm_v2_cluster.cloudhsm_v2_cluster.cluster_id

# }
# output "cluster_id" {
#   description = "CloudHSM V2 Cluster ID"
#   value       = aws_cloudhsm_v2_cluster.cloudhsm_v2_cluster.cluster_id
# }

# output "hsm_id" {
#   description = "CloudHSM V2 HSM ID"
#   value       = aws_cloudhsm_v2_hsm.cloudhsm_v2_hsm.id
# }