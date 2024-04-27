resource "tls_private_key" "tls_private_key" {
  for_each  = var.key_pair
  algorithm = "ED25519"
}

resource "aws_key_pair" "private_key" {
  for_each   = var.key_pair
  key_name   = each.value.key_name
  public_key = tls_private_key.tls_private_key[each.key].public_key_openssh

  provisioner "local-exec" {
    command = <<-EOF
  echo "${tls_private_key.tls_private_key[each.key].private_key_openssh}" > ${each.key}.pem
  chmod 600 ${each.key}.pem
  EOF
  }
  
  tags = {
    Name = each.key
  }
  
}
