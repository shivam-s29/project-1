*vpc.tf*

#Creating vpc

resource "aws_vpc" "demovpc" {
cidr_block = "{var.vpc_cidr}"
instance_tenancy= "default"
tags = {
 Name = "Demo vpc"
 }
}

