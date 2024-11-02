# ./modules/nw/vpc.tf

resource "aws_vpc" "this" {
  cidr_block = var.vpc.cidr

  tags = {
    Name = "${var.app_name}-vpc"
  }
}
