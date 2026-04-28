variable "vpc_id" {
    type            = string
}

variable "sg_name" {
    type            = string
}

variable "ingress_ports" {
    default         = [22, 80]
    type            = list(number)
}

variable "tags" {
    type            = map(string)
    default         = {}
}
