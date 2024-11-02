# ./modules/nw/private_subnets.tf

resource "aws_subnet" "privates" {
  count      = length(var.private_subnets)
  vpc_id     = aws_vpc.this.id
  cidr_block = var.private_subnets[count.index].private_subnet_cidr
  availability_zone = var.private_subnets[count.index].availability_zone
  
  tags = {
    Name = "${var.app_name}-private-${count.index}"
  }
}

resource "aws_route_table" "private_rt" {
  count  = length(var.private_subnets)
  vpc_id = aws_vpc.this.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgws[count.index].id
  }

  tags = {
    Name = "${var.app_name}-private_rt-${count.index}"
  }
}

resource "aws_route_table_association" "private_asso" {
  count     = length(var.private_subnets)
  subnet_id = aws_subnet.privates[count.index].id
  route_table_id = aws_route_table.private_rt[count.index].id
}
