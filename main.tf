# resource "aws_subnet" "main" {
#   for_each          = var.subnets
#   vpc_id            = var.vpc_id
#   cidr_block        = each.value.cidr_block #cidrsubnet(data.aws_vpc.main.cidr_block, 4, 1)
#   availability_zone = each.value.availability_zone
#   tags = {
#     Name = join("-", [var.prefix, "subnet"])
#   }
# }

resource "aws_subnet" "subnet" {
  vpc_id                  = var.vpc_id
  for_each                = var.subnets
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = each.value.name
  }
}
output "subnet_ids" {
  value = { for k, v in aws_security_group.default : k => v.id }
}