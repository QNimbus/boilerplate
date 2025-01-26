#!/bin/sh

# Copy default Caddyfile if it does not exist
if [ ! -f /etc/caddy/Caddyfile ]; then
    echo "Caddyfile not found. Copying default configuration..."
    cp /defaults/etc/caddy/Caddyfile /etc/caddy/Caddyfile
else
    echo "Caddyfile already exists. Skipping copy."
fi

# Copy default index.html if it does not exist
if [ ! -f /srv/index.html ]; then
    echo "index.html not found. Copying default web file..."
    cp /defaults/srv/index.html /srv/index.html
else
    echo "index.html already exists. Skipping copy."
fi

# Run the original command
exec "$@"
