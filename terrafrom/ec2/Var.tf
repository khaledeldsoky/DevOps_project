variable "Ec2" {
  type = map(object({
    ami                 = string
    instance_type       = string
    subnet_id           = string
    associate_public_ip = bool
    key_name            = string
    security_group_ids  = string
  }))
}
