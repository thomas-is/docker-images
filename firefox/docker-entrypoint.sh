#!/bin/sh

usermod firefox -u $USER_ID
TOR_PASS=$( date +%s | sha256sum | base64 | head -c 32 ; echo )
echo "$TOR_PASS" > /home/firefox/torpass
chmod 644 /home/firefox/torpass

HASH=$( su firefox -c "tor --hash-password \"$TOR_PASS\"" )
cat <<-EOF > /etc/tor/torrc
  Log notice file /var/log/tor/notices.log
  DataDirectory /var/lib/tor
  ControlPort 9051
  HashedControlPassword ${HASH}
  CookieAuthentication 0
EOF

su firefox -c 'firefox -CreateProfile "main /home/firefox/profile"'

su firefox -c 'touch /home/firefox/profile/pref.js'

cat <<-EOF > /home/firefox/profile/pref.js
user_pref("network.proxy.socks", "127.0.0.1");
user_pref("network.proxy.socks_port", 9050);
user_pref("network.proxy.type", 1);
EOF

su firefox -c "tor" &

CMD="$@"
su firefox -p main -c "$CMD"
