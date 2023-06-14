FROM mysql:latest
RUN mkdir -p /var/lib/secrets && chmod 700 /var/lib/secrets
VOLUME ["/docker-entrypoint-initdb.d", "/var/lib/secrets"]
