#!/bin/sh

echo "[info] setting up user $USER"

adduser $USER -D -h /user -s $SHELL

PASS=$( < /dev/urandom tr -dc A-Za-z0-9 | head -c128 )
passwd $USER << EOF
$PASS
$PASS
EOF

passwd -u $USER

mkdir -p /user/.ssh
chown -R $USER:$USER /user/.ssh
chmod -R 700 /user/.ssh

echo "[info] setting up sshd"

if [ ! -f /etc/ssh/ssh_host_rsa_key ] ; then
  echo "[info] ssh-keygen"
  ssh-keygen -A
fi

cat << EOF > /etc/ssh/sshd_config
Port 22
PasswordAuthentication no
PermitRootLogin without-password
Banner none
PrintMotd no
#Subsystem sftp internal-sftp
EOF

exec $@
