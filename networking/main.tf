#--------------networking/main.tf-----------------------

data "aws_availability_zones" "available" {}

resource "aws_vpc" "tf_demo_vpc" {
 cidr_block = "${var.vpc_cidr}"
 enable_dns_hostnames = true
 enable_dns_support = true

 tags {
    Name = "tf_demo_vpc"
  }
}


resource "aws_internet_gateway" "tf_demo_igw" {


 vpc_id = "${aws_vpc.tf_demo_vpc.id}"
 
 tags {
  Name ="tf_demo_igw"
 }

}

resource "aws_route_table" "tf_demo_public_rt" {

  vpc_id = "${aws_vpc.tf_demo_vpc.id}"
  
  route {
   cidr_block = "0.0.0.0/0"
   gateway_id = "${aws_internet_gateway.tf_demo_igw.id}"
  }

 tags {
   Name = "tf_demo_public_rt"
 }

}


resource "aws_default_route_table" "tf_demo_private_rt" {

 default_route_table_id = "{aws_vpc.tf_demo_vpc.default_route_table.id}"
 tags {
  Name = "tf_demo_private_rt"
 }

}
