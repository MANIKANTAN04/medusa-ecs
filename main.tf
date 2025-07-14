terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}


module "network" {
  source              = "./terraform/network"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
}

module "security" {
  source = "./terraform/security"
  vpc_id = module.network.vpc_id
}

module "alb" {
  source      = "./terraform/alb"
  subnet_ids  = [module.network.public_subnet_id]
  alb_sg_id   = module.security.alb_sg_id
  vpc_id      = module.network.vpc_id
}

module "ecs" {
  source             = "./terraform/ecs"
  db_username        = var.db_username
  db_password        = var.db_password
  vpc_id             = module.network.vpc_id
  public_subnet_id   = module.network.public_subnet_id
  ecs_sg_id          = module.security.ecs_sg_id
  target_group_arn   = module.alb.target_group_arn
}


variable "dbpassword" {
  description = "Database password"
  type        = string
}
