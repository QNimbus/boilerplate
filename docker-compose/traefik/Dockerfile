ARG TAG_VERSION=v3.3
FROM traefik:${TAG_VERSION}

ENV TRAEFIK_USER_PRIVATE_KEY=

# Enable ssh client in Traefik container
RUN apk add --no-cache openssh

# Create an ssh client configuration for the traefik user
RUN echo "Host *" > /etc/ssh/ssh_config && \
    echo "    User traefik" >> /etc/ssh/ssh_config && \
    echo "    IdentityFile /root/.ssh/id_rsa" >> /etc/ssh/ssh_config && \
    echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config && \
    echo "    UserKnownHostsFile=/dev/null" >> /etc/ssh/ssh_config

# Add custom entrypoint script
COPY entrypoint-custom.sh /entrypoint-custom.sh
RUN chmod +x /entrypoint-custom.sh

# Use the custom entrypoint
ENTRYPOINT ["/entrypoint-custom.sh"]
