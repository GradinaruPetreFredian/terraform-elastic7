##################################################################################
# RESOURCES
##################################################################################

# NETWORKING #
resource "aws_vpc" "my-vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = local.common_tags
}

resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.my-vpc.id

  tags = local.common_tags
}

resource "aws_subnet" "my-subnet" {
  cidr_block              = var.vpc_subnet_cidr_block
  vpc_id                  = aws_vpc.my-vpc.id
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = local.common_tags
}

# ROUTING #
resource "aws_route_table" "my-rtb" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw.id
  }

  tags = local.common_tags
}

resource "aws_route_table_association" "my-rta-subnet" {
  subnet_id      = aws_subnet.my-subnet.id
  route_table_id = aws_route_table.my-rtb.id
}

# SECURITY GROUPS #

resource "aws_security_group" "my-sg" {
  vpc_id = aws_vpc.my-vpc.id

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/24"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.common_tags

}
