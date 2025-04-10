provider "aws" {
  region  = var.aws_region
  profile = "AdministratorAccess-376836369335"
}

module "vpc" {
  source              = "../../modules/vpc"
  environment         = var.environment
  azs                 = var.azs
  public_subnet_cidrs = var.public_subnet_cidrs
  vpc_cidr            = var.vpc_cidr
}

module "alb" {
  source      = "../../modules/alb"
  environment = var.environment
  vpc_id      = module.vpc.vpc_id
  subnet_ids  = module.vpc.public_subnet_ids
  instance_id = module.ec2.instance_id
}

module "ec2" {
  source         = "../../modules/ec2"
  alb_sg_id      = module.alb.alb_sg_id
  ami_id         = var.ami_id
  environment    = var.environment
  instance_type  = var.instance_type
  ssh_cidr_block = var.ssh_cidr_block
  subnet_id      = module.vpc.public_subnet_ids[0]
  vpc_id         = module.vpc.vpc_id
  # key_name      = var.key_name
}