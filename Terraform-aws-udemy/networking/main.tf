
data "aws_availability_zones" "available" {}

resource "random_integer" "random" {
    min = 1
    max = 100
}

resource "random_shuffle" "az_list" {
    input = data.aws_availability_zones.available.names
    result_count = var.max_subnets
}

resource "aws_vpc" "dev_vpc" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true
    enable_dns_support = true

    tags = {
        Name = "dev_vpc-${random_integer.random.id}"
    }
}

resource "aws_subnet" "dev_public_subnet" {
    count = var.public_sn_count
    vpc_id = aws_vpc.dev_vpc.id
    cidr_block = var.public_cidrs[count.index]
    map_public_ip_on_launch = true
    availability_zone = random_shuffle.az_list.result[count.index]

    tags = {
        Name = "dev_public_${count.index + 1}"
    }
}

resource "aws_subnet" "dev_private_subnet" {
    count = var.private_sn_count
    vpc_id = aws_vpc.dev_vpc.id
    cidr_block = var.private_cidrs[count.index]
    map_public_ip_on_launch = false
    availability_zone = random_shuffle.az_list.result[count.index]

    tags = {
        Name = "dev_private_${count.index + 1}"
    }
}
