# Peering connection from 10.0.0.0/16 -> 10.1.0.0/16

resource "aws_vpc_peering_connection" "first" {
  depends_on = [ module.vpc1,module.vpc2, module.vpc3 ]
  #peer_owner_id = "ANH"
  peer_vpc_id   = module.vpc1.vpc_id
  vpc_id        = module.vpc2.vpc_id
  auto_accept   = true

  tags = {
    Name = "VPC Peering between VPC1 and VPC2"
  }
}

// Split considering the impact on existing routes
locals {
  public_route_table_vpc1_map = { for idx, id in module.vpc1.public_route_table_ids : idx => id }
} # just an easier way to deal with many route table
locals {
  public_route_table_vpc2_map = { for idx, id in module.vpc2.public_route_table_ids : idx => id }
} # just an easier way to deal with many route table
locals {
  public_route_table_vpc3_map = { for idx, id in module.vpc3.public_route_table_ids : idx => id }
} # just an easier way to deal with many route table


resource "aws_route" "vpc1" {
  depends_on = [ module.vpc1,module.vpc2, module.vpc3 ]
  for_each = local.public_route_table_vpc1_map
  route_table_id            = each.value
  destination_cidr_block    = module.vpc2.vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.first.id
}

resource "aws_route" "vpc2" {
  depends_on = [ module.vpc1,module.vpc2, module.vpc3 ]
  for_each = local.public_route_table_vpc2_map
  route_table_id            = each.value
  destination_cidr_block    = module.vpc1.vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.first.id
}



# Peering connection from 10.1.0.0/16 -> 10.2.0.0/16
resource "aws_vpc_peering_connection" "second" {
  #peer_owner_id = "ANH"
  peer_vpc_id   = module.vpc2.vpc_id
  vpc_id        = module.vpc3.vpc_id
  auto_accept   = true
}

resource "aws_route" "vpc3" {
  depends_on = [ module.vpc1,module.vpc2, module.vpc3 ]
  for_each = local.public_route_table_vpc3_map
  route_table_id            = each.value
  destination_cidr_block    = module.vpc2.vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.second.id
}

resource "aws_route" "vpc2_2" {
  depends_on = [ module.vpc1,module.vpc2, module.vpc3 ]
  for_each = local.public_route_table_vpc2_map
  route_table_id            = each.value
  destination_cidr_block    = module.vpc3.vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.second.id
}
