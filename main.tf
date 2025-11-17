provider "aws" {
  region = "us-east-1"
}

module "network" {
  source = "./network"
}

module "security" {
  source = "./security"
  vpc_id = module.network.vpc_id
}

module "compute" {
  source     = "./compute"
  subnet_ids = [module.network.public_subnet_id]
  sg_id      = module.security.web_sg_id
}

module "lb" {
  source     = "./loadbalancer"
  subnet_ids = [module.network.public_subnet_id]
  sg_id      = module.security.web_sg_id
}
