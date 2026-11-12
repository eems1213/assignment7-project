FROM fedora:latest
RUN dnf install -y httpd && dnf clean all
USER root
RUN mkdir -p /structure && chmod 777 /structure
USER sync
RUN mkdir -p /structure/sync-work
USER nobody
RUN mkdir -p /structure/nobody-work
USER root
RUN useradd -m collin
RUN echo "Containers are easy!" > /var/www/html/index.html
EXPOSE 80
ENTRYPOINT ["/usr/sbin/httpd", "-DFOREGROUND"]
