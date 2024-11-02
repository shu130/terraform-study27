# ./modules/ecs/variables.tf

variable "region" {
  type = string
}

variable "app_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "lb_security_group_id" {
  type = string
}

variable "lb_target_group_arn" {
  type = string
}
