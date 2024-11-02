# ./modules/nw/outputs.tf

output "vpc_id" {
  value = aws_vpc.this.id
}

output "private_subnets_ids" {
  value = aws_subnet.privates[*].id
}

output "private_route_table_ids" {
  value = aws_route_table.private_rt[*].id
}

output "public_subnets_ids" {
  value = aws_subnet.publics[*].id
}

output "public_route_table_ids" {
  value = aws_route_table.public_rt[*].id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.natgws[*].id
}