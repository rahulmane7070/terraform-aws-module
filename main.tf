provider "aws" {
 region = "${var.aws_region}"
}


# deploy Storage resources
module "storage" {
 source = "./storage"
 project_name = "${var.project_name}"
}


# Deploy networking resources 

module "networking" {
 source = "./networking"
 vpc_cidr = "${var.vpc_cidr}"
 public_cidrs = "${var.public_cidrs}"
 accessip = "${var.accessip}"


}


