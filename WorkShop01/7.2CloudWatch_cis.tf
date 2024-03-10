# # CIS benchmark
# # - Center for internet security session might need more documenting 
# # Create Log Group for CIS
# resource "random_string" "random" {
#   length = 6
#   special = false
#   upper = false
# } 

# resource "aws_cloudwatch_log_group" "cis_log_group" {
#   name = "cis-log-group-${random_string.random.result}"
# }

# # Define CIS Alarms
# module "all_cis_alarms" {
#   source  = "terraform-aws-modules/cloudwatch/aws//modules/cis-alarms"
#   version = "2.0.0"
# # DisableOrDeleteCMK Data encrypted with disabled or deleted keys will no longer be accessible.
# # VPCChanges Monitoring changes to VPC will help ensure VPC traffic flow is not getting impacted
#   disabled_controls = ["DisableOrDeleteCMK", "VPCChanges"]
#   log_group_name = aws_cloudwatch_log_group.cis_log_group.name 
#   alarm_actions  = [aws_sns_topic.myasg_sns_topic.arn]
#   tags = {name= "cis_alarm"}
# }