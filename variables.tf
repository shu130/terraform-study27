# ./variables.tf

#-------------------------------
# provider, etc

variable "profile" {
  type    = string
  default = "default"
}

variable "region" {
  type = string
}

variable "app_name" {
  type = string
}

#-------------------------------
# nw

variable "vpc" {
  type = object({
    cidr = string
  })
}

variable "private_subnets" {
  type = list(object({
    private_subnet_cidr = string
    availability_zone   = string
  }))
}

variable "public_subnets" {
  type = list(object({
    public_subnet_cidr = string
    availability_zone  = string
  }))
}

