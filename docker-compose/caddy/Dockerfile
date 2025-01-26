# Use the builder stage to include additional modules
ARG TAG_VERSION=2-alpine
ARG TAG_BUILDER_VERSION=2-builder-alpine
FROM caddy:${TAG_BUILDER_VERSION} AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/porkbun

# Final stage
FROM caddy:${TAG_VERSION}

# Copy the custom Caddy binary from the builder
COPY --from=builder /usr/bin/caddy /usr/bin/caddy

# Create the default directories
RUN mkdir -p /defaults/etc/caddy /defaults/srv

# Download the entrypoint.sh script from a GitHub Gist
RUN echo "cache busting: $(date)" && wget -O /usr/bin/entrypoint.sh https://gist.githubusercontent.com/QNimbus/3937206d21dc4357096a68e1c61e23af/raw/entrypoint.sh

# Download the Caddyfile from a GitHub Gist
RUN echo "cache busting: $(date)" && wget -O /defaults/etc/caddy/Caddyfile https://gist.githubusercontent.com/QNimbus/3937206d21dc4357096a68e1c61e23af/raw/Caddyfile

# Download the index.html file from a GitHub Gist
RUN echo "cache busting: $(date)" && wget -O /defaults/srv/index.html https://gist.githubusercontent.com/QNimbus/3937206d21dc4357096a68e1c61e23af/raw/index.html

# Set up entrypoint script
RUN chmod +x /usr/bin/entrypoint.sh

# Set the working directory to /srv
WORKDIR /srv

# Set entrypoint
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
