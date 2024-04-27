#  ssh تقدر توصلها  private ec2 دي عشان لو عندك 

cat <<EOF > ~/.ssh/config 
host bastion
   HostName $1
   User ubuntu
   IdentityFile [ path_to_private_key ]
   StrictHostKeyChecking=no

host privateinstance1
   HostName  $2
   user  ubuntu
   IdentityFile [ path_to_private_key ]
   ProxyCommand ssh -q -W %h:%p  bastion
   StrictHostKeyChecking=no

host privateinstance2
   HostName  $3
   user  ubuntu
   IdentityFile [ path_to_private_key ]
   ProxyCommand ssh -q -W %h:%p  bastion
   StrictHostKeyChecking=no
EOF
