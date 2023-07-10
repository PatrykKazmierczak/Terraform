resource "random_integer" "random" {
    min = 1
    max = 100
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
    count = length(var.public_cidrs)
    vpc_id = aws_vpc.dev_vpc.id
    cidr_block = var.public_cidrs[count.index]
    map_public_ip_on_launch = true
    availability_zone = ["eu-central-1a", "eu-central-1b", "eu-central-1c"][count.index]

    tags = {
        Name = "dev_public_${count.index + 1}"
    }
}