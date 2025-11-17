terraform {
  required_version = ">= 1.4.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


# -------------------------
# MÓDULO DE REDE
# -------------------------
module "network" {
  source = "./modules/network"
}

# -------------------------
# MÓDULO DE SECURITY GROUPS
# -------------------------
module "security" {
  source = "./modules/security"
}

# -------------------------
# LOAD BALANCER (REFEITO)
# -------------------------
module "lb" {
  source = "./modules/lb"

  # Esses nomes devem existir dentro do módulo lb
  public_subnet_ids = module.network.public_subnets
  alb_sg_id         = module.security.web_sg_id
}

# -------------------------
# MÓDULO DE COMPUTE/EC2
# -------------------------
module "compute" {
  source = "./modules/compute"

  instance_subnet_id = module.network.public_subnets[0]
  instance_sg_id     = module.security.web_sg_id
}