variable "subnet_ids" {
  type = list(string)
  description = "Subnets usadas pelo Load Balancer"
}

variable "sg_id" {
  type = string
  description = "Security Group do Load Balancer"
}