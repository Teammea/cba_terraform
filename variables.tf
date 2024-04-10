variable "region" {
  default = "eu-west-2"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_ami" {
  default = "ami-0fe87e3ed54a170ce"
}


variable "vpc_id" {
  description = "vpc-038f9659a02c755fb"
  type        = string
  default     = "vpc-038f9659a02c755fb"
}

variable "subnet_id" {
  description = "subnet-0bc2c04273303f686"
  type        = string
  default     = "subnet-0bc2c04273303f686"

}

variable "key_name" {
  default = "cba_keypair"
}