# ./main.tf

module "nw" {
  source          = "./modules/nw"
  app_name        = var.app_name
  vpc             = var.vpc
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
}

module "lb" {
  source         = "./modules/lb"
  app_name       = var.app_name
  vpc_id         = module.nw.vpc_id
  public_subnets = module.nw.public_subnets_ids
}

module "ecs" {
  source   = "./modules/ecs"
  app_name = var.app_name
  region   = var.region
  vpc_id   = module.nw.vpc_id
  subnet_ids = module.nw.private_subnets_ids
  lb_security_group_id = module.lb.security_group_id
  lb_target_group_arn = module.lb.alb_target_group_arn
}

module "cloudwatch" {
  source = "./modules/cloudwatch"
  app_name = var.app_name
}