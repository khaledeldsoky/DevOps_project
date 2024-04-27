resource "null_resource" "bash_script" {

  triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "local-exec" {
    command = <<-EOF
   ../bash/hosts.sh ${module.Ec2.ec2["public_ec2_1"].public_ip}
    EOF
  }

  depends_on = [
    module.Ec2,
    module.eks
    # module.lb,
    # module.launch_template
  ]
}


resource "null_resource" "ansible" {
  depends_on = [ null_resource.bash_script ]
  provisioner "local-exec" {
    command = <<-EOF
     cd ../ansible
     ansible-playbook -i hosts playbook.yml 
    EOF
  }
}



