#!/bin/sh

echo "[info] adduser $USER $UID:$UID $SHELL"
adduser $USER -u $UID -D -s $SHELL
PASS=$( < /dev/urandom tr -dc A-Za-z0-9 | head -c128 )
passwd $USER << EOF
$PASS
$PASS
EOF

if [ ! -f /etc/ssh/ssh_host_rsa_key ] ; then
  echo "[info] generating host RSA key"
  ssh-keygen -A
else
  echo "[info] found existing host RSA key"
fi

echo "[info] setting up sshd"
cat > /etc/ssh/sshd_config << EOF
Port 22
PasswordAuthentication no
PermitRootLogin without-password
AuthorizedKeysFile /authorized_keys
Banner none
PrintMotd no
#Subsystem sftp internal-sftp
EOF

exec $@
