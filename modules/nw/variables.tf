# ./modules/nw/variables.tf

variable "app_name" {
  type = string
}

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
