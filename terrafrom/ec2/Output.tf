data "aws_instances" "type_public"{
  depends_on = [aws_instance.Ec2]
  filter {
    name = "tag:type"
    values = ["public"]
  }
}


data "aws_instances" "type_private"{
  depends_on = [aws_instance.Ec2]
  filter {
    name = "tag:type"
    values = ["private"]
  }
}


output "ec2" {
  description = "List of EC2 instances created"
  value       = aws_instance.Ec2
}



output "public_instance_ips" {
  value = data.aws_instances.type_public.public_ips
}

output "private_instance_ips" {
  value = data.aws_instances.type_private.private_ips
}