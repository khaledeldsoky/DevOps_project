variable "vpc_id" {
  type = string
}

variable "key_pair" {
  type = map(object({
   key_name  = string
  }))
}