# ./modules/nw/public_subnet.tf

resource "aws_subnet" "publics" {
  count      = length(var.public_subnets)
  vpc_id     = aws_vpc.this.id
  cidr_block = var.public_subnets[count.index].public_subnet_cidr
  availability_zone = var.public_subnets[count.index].availability_zone
  
  tags = {
    Name = "${var.app_name}-publics-${count.index}"
  }
}

resource "aws_route_table" "public_rt" {
  count  = length(var.public_subnets)
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.app_name}-public_rt-${count.index}"
  }
}

resource "aws_route_table_association" "public_asso" {
  count     = length(var.public_subnets)
  subnet_id = aws_subnet.publics[count.index].id
  route_table_id = aws_route_table.public_rt[count.index].id
}
