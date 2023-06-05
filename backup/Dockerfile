FROM alpine:latest
RUN apk --update-cache --no-cache rsync mysql-client
COPY backup /usr/local/bin
RUN chmod +x /usr/local/bin/backup
RUN mkdir -p /var/lib/backup/archives /var/lib/backup/src
RUN cd /var/lib/backup/src && mkdir redmine wordpress
RUN echo "0 4 * * * /usr/local/bin/backup" >> /var/spool/cron/crontabs/root
VOLUME ["/var/lib/backup/archives", "/var/lib/backup/src/redmine", "/var/lib/backup/src/wordpress"]
CMD ["crond", "-f", "-d", "8"]
