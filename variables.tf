variable "region" {
  default = "us-east-1"
}

variable "azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "ami_id" {
  description = "AMI da aplicação"
}

variable "instance_type" {
  default = "t3.micro"
}

