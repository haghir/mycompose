FROM alpine:latest
RUN apk add --update-cache --no-cache rsync mysql-client
COPY backup /usr/local/bin
RUN chmod +x /usr/local/bin/backup
RUN mkdir -p /var/lib/secrets/mysql && chmod 700 /var/lib/secrets/mysql
RUN mkdir -p /var/lib/backup/archives /var/lib/backup/src
RUN cd /var/lib/backup/src && mkdir -p redmine/files wordpress/html
RUN echo "0 4 * * * /usr/local/bin/backup" >> /var/spool/cron/crontabs/root
CMD ["crond", "-f", "-d", "8"]
