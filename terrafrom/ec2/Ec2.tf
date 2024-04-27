resource "aws_instance" "Ec2" {
  for_each                    = var.Ec2
  ami                         = each.value.ami
  instance_type               = each.value.instance_type
  subnet_id                   = each.value.subnet_id
  associate_public_ip_address = each.value.associate_public_ip
  key_name                    = each.value.key_name
  vpc_security_group_ids      = [each.value.security_group_ids]

  root_block_device {
    volume_size = 30 
    volume_type = "gp2"
  }
  
  tags = {
    Name = each.key
    type = each.value["associate_public_ip"] == true ? "public" : "private"
  }

}
