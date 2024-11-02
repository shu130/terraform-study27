# ./outputs.tf

#------------------------
# nw
output "vpc_id" {
  value = module.nw.vpc_id
}

output "public_subnets_ids" {
  value = module.nw.public_subnets_ids
}

output "private_subnets_ids" {
  value = module.nw.private_subnets_ids
}

/*
#------------------------
# nat-gw
output "nat_gateway_id" {
  value = module.nw.nat_gateway_id
}
*/

/*
#------------------------
# ecs
output "ecs_cluster_id" {
  value = module.ecs.ecs_cluster_id
}

output "ecs_cluster_name" {
  value = module.ecs.ecs_cluster_name
}

output "ecs_task_definition_arn" {
  value = module.ecs.ecs_task_definition_arn
}

output "ecs_service_name" {
  value = module.ecs.ecs_service_name
}
*/

#------------------------
# alb
/*
output "alb_arn" {
  value = module.lb.alb_arn
}

output "alb_dns_name" {
  value = module.lb.alb_dns_name
}

output "alb_target_group_arn" {
  value = module.lb.alb_target_group_arn
}
*/

/*
#------------------------
# cloudwatch
output "cloudwatch_log_group_id" {
  value = module.cloudwatch.cloudwatch_log_group_id
}
output "cloudwatch_log_group_name" {
  value = module.cloudwatch.cloudwatch_log_group_name
}
*/
