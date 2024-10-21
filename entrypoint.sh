#!/bin/bash

PORT=${PORT:-51820}
SERVER_PRIVATE_KEY=${SERVER_PRIVATE_KEY}
ADDRESS=${ADDRESS:-169.254.0.1/24}
CLIENT_PUBLIC_KEY=${CLIENT_PUBLIC_KEY}
CLIENT_SHARED_KEY=${CLIENT_SHARED_KEY}
CLIENT_ALLOWED_IP=${CLIENT_ALLOWED_IP:-169.254.0.2/32}
MTU=${MTU:-1420}
PERSISTENT_KEEPALIVE=${PERSISTENT_KEEPALIVE:-10}

cat <<EOF > /etc/wireguard/wg0.conf
[Interface]
PrivateKey = $SERVER_PRIVATE_KEY
Address = $ADDRESS
ListenPort = $PORT
MTU = $MTU

[Peer]
PublicKey = $CLIENT_PUBLIC_KEY
EOF

if [[ -n "$CLIENT_SHARED_KEY" ]]; then
    echo "PresharedKey = $CLIENT_SHARED_KEY" >> /etc/wireguard/wg0.conf
fi

echo "AllowedIPs = $CLIENT_ALLOWED_IP" >> /etc/wireguard/wg0.conf
echo "PersistentKeepalive = $PERSISTENT_KEEPALIVE" >> /etc/wireguard/wg0.conf

wg-quick up wg0

tail -f /dev/null
