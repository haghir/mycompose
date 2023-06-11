FROM mysql:latest
COPY prepare-minauth.sh /docker-entrypoint-initdb.d
COPY prepare-redmine.sh /docker-entrypoint-initdb.d
COPY prepare-wordpress.sh /docker-entrypoint-initdb.d
RUN cd "/docker-entrypoint-initdb.d" && \
    chmod +x prepare-minauth.sh prepare-redmine.sh prepare-wordpress.sh
