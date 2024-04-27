#   private key بتاع ال  path حط انت بقا انت ال 

cat  <<-OEF  > /mnt/linux/data/project/devops_1/infra/ansible/hosts
[bastion]
$1 -o StrictHostKeyChecking=no  ansible_ssh_private_key_file=/mnt/linux/data/project/devops_1/infra/terrafrom/public_ec2_key_name.pem 

OEF