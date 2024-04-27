
output "key_name" {
  value = { for key in  aws_key_pair.private_key : key.tags_all["Name"] => key.key_name  }
}

output "security_group_private" {
  value = aws_security_group.private_ec2_sg
}


output "security_group_public" {
  value = aws_security_group.public_ec2_sg
}

output "security_group_jenkins" {
  value = aws_security_group.jenkins_ec2_sg
}
