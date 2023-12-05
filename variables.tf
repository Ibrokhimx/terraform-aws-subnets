variable "module" {
  type = string
}

variable "subnets" {
  type = map(object({
    name              = string
    cidr_block        = string
    availability_zone = string
  }))
  default = {}
}

variable "prefix" {
  type = string
}