#   private key بتاع ال  path حط انت بقا انت ال 
cat  <<-OEF  > [ path_to_ansible_hosts_file ]
[bastion]
$1 ansible_ssh_private_key_file=/mnt/linux/data/project/devops_1/infra/terrafrom/public_ec2_key_name.pem
OEF