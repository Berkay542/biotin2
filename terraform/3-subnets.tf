resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.16.0/20"

  tags = {
    "Name"                                             = "${var.env}-private1"
    "kubernetes.io/role/internal-elb"                  = 1
    "kubernetes.io/cluster/${var.env}-${var.eks_name}" = "owned"
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.48.0/20"

  tags = {
    "Name"                                             = "${var.env}-private2"
    "kubernetes.io/role/internal-elb"                  = 1
    "kubernetes.io/cluster/${var.env}-${var.eks_name}" = "owned"
  }
}

resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/20"
  map_public_ip_on_launch = true

  tags = {
    "Name"                                             = "${var.env}-public1"
    "kubernetes.io/role/elb"                           = "1"
    "kubernetes.io/cluster/${var.env}-${var.eks_name}" = "owned"
  }
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.32.0/20"
  map_public_ip_on_launch = true

  tags = {
    "Name"                                             = "${var.env}-public2"
    "kubernetes.io/role/elb"                           = 1
    "kubernetes.io/cluster/${var.env}-${var.eks_name}" = "owned"
  }
}