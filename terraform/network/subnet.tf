resource "aws_subnet" "public_subnet" {
  cidr_block = var.public_subnet_cidr
  vpc_id     = aws_vpc.main.id
}
