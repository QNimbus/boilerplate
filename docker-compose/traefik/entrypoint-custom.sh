#!/bin/sh
set -e

# To convert a private key to base64, use:
# $> cat ./id_rsa | base64 -w 0
# or:
# $> base64 -w 0 ./id_rsa

# Write private key from base64-encoded environment variable
if [ -n "$TRAEFIK_USER_PRIVATE_KEY" ]; then
    mkdir -p /root/.ssh
    echo "$TRAEFIK_USER_PRIVATE_KEY" | base64 -d > /root/.ssh/id_rsa
    chmod 600 /root/.ssh/id_rsa
    echo "Private key written to /root/.ssh/id_rsa"
else
    echo "No TRAEFIK_USER_PRIVATE_KEY environment variable found. Skipping key setup."
fi

# Call the original entrypoint
exec /entrypoint.sh "$@"
