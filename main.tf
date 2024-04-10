provider "aws" {
 region = var.region
}

resource "aws_security_group" "cba_tf_sg" {
 name        = "cba_tf_sg"
 description = "allow all traffic"
 ingress {
   from_port  = 22
   to_port    = 22
   protocol   = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }
 ingress {
   from_port  = 80
   to_port    = 80
   protocol   = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }
 egress {
   from_port  = 0
   to_port    = 0
   protocol   = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
 tags = {
   name = "CBAterraformSG"
 }
}

# resource "aws_subnet" "example" {
#  vpc_id            = data.aws_vpc.selected.id
#  availability_zone = "eu-west-2a"
#  cidr_block        = cidrsubnet(data.aws_vpc.selected.cidr_block, 4, 1)
# }


data "aws_key_pair" "sample_kp" {
  key_name = var.key_name
}

data "aws_vpc" "selected" {
  id = var.vpc_id
}

resource "aws_instance" "cba_tf_instance" {
  instance_type = var.instance_type
#  security_groups = [aws_security_group.cba_tf_sg.name]
  ami = var.instance_ami
  subnet_id = var.subnet_id
  key_name = var.key_name
  user_data = file("install_apache.sh")

  tags = {
    Name = "CBATerraformInstance"
    }
}