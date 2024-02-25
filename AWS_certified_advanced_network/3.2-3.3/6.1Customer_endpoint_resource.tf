resource "aws_vpc_endpoint" "application_vpc_endpoint" {
  vpc_id                       = module.Consumer.vpc_id
  vpc_endpoint_type            = "Interface"
  #associate with the vpc service endpoint using name
  service_name                 = "${aws_vpc_endpoint_service.Provider_nlb_endpoint_interface.service_name}"
  subnet_ids                   = [module.Consumer.public_subnets[0]]
  security_group_ids           = [module.consumer_security-group.security_group_id]
  private_dns_enabled          = false
}
# resource "aws_vpc_endpoint_route_table_association" "example" {
#   route_table_id  = module.Consumer.public_route_table_ids[0]
#   vpc_endpoint_id = aws_vpc_endpoint.application_vpc_endpoint.id
# }
# resource "aws_vpc_endpoint_subnet_association" "application" {
#   vpc_endpoint_id = aws_vpc_endpoint.application_vpc_endpoint.id
#   subnet_id       = var.provider_public_subnets[0]
# }