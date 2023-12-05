resource "aws_subnet" "main" {
  for_each          = var.subnets
  vpc_id            = var.module
  cidr_block        = each.value.cidr_block #cidrsubnet(data.aws_vpc.main.cidr_block, 4, 1)
  availability_zone = each.value.availability_zone
  tags = {
    Name = join("-", [var.prefix, "subnet"])
  }
}

