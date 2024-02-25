resource "aws_vpc_endpoint_service" "Provider_nlb_endpoint_interface" {
  acceptance_required        = false
  network_load_balancer_arns = [module.nlb.arn]
  tags = {
    name = "Provider_nlb_endpoint_interface"
  }
}

output "nlb_service_name" {
  value = aws_vpc_endpoint_service.Provider_nlb_endpoint_interface.service_name
}