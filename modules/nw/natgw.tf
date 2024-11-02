# ./modules/nw/natgw.tf

resource "aws_nat_gateway" "natgws" {
  count         = length(var.public_subnets)
  allocation_id = aws_eip.nat_eip[count.index].id
  subnet_id     = aws_subnet.publics[count.index].id

  tags = {
    Name = "${var.app_name}-ngw-${count.index}"
  }
}

resource "aws_eip" "nat_eip" {
  count  = length(var.public_subnets)
  domain = "vpc"  #=> EIPをVPC内に割り当てる

  tags = {
    Name = "${var.app_name}-nat_eip-${count.index}"
  }
}
