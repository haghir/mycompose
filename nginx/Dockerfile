FROM nginx:latest
RUN echo "\nstream {\n    include /etc/nginx/conf.d/*.stream;\n}" >> /etc/nginx/nginx.conf
COPY *.conf /etc/nginx/conf.d
COPY *.stream /etc/nginx/conf.d
