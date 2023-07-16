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
    count = var.public_sn_count
    vpc_id = aws_vpc.dev_vpc.id
    cidr_block = var.public_cidrs[count.index]
    map_public_ip_on_launch = true
    availability_zone = ["eu-central-1a", "eu-central-1b", "eu-central-1c"][count.index]

    tags = {
        Name = "dev_public_${count.index + 1}"
    }
}

resource "aws_route_table_association" "dev_public_assoc" {
    count = var.public_sn_count
    subnet_id = aws_subnet.dev_public_subnet.*.id[count.index]
    route_table_id = aws_route_table.dev_public_rt.id
}

resource "aws_subnet" "dev_private_subnet" {
    count = var.private_sn_count
    vpc_id = aws_vpc.dev_vpc.id
    cidr_block = var.private_cidrs[count.index]
    map_public_ip_on_launch = false
    availability_zone = ["eu-central-1a", "eu-central-1b", "eu-central-1c"][count.index]

    tags = {
        Name = "dev_private_${count.index + 1}"
    }
}


resource "aws_internet_gateway" "dev_internet_gateway" {
    vpc_id = aws_vpc.dev_vpc.id

    tags = {
        Name = "dev-igw"
    }
}

resource "aws_route_table" "dev_public_rt" {
    vpc_id = aws_vpc.dev_vpc.id

    tags = {
        Name = "dev_public"
    }
}

resource "aws_route" "default_route" {
    route_table_id = aws_route_table.dev_public_rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev_internet_gateway.id
}

resource "aws_default_route_table" "dev_private_rt" {
    default_route_table_id = aws_vpc.dev_vpc.default_route_table_id

    tags = {
        Name = "dev_private"
    }
}