FROM resin/rpi-raspbian

# Metadata
LABEL org.label-schema.url="https://www.nginx.com" \
      org.label-schema.name="Ngnix" \
      org.label-schema.description="Reverse proxy" \
      org.label-schema.docker.schema-version="1.0"

RUN apt-get update \
    && apt-get install -y apt-utils \
    && apt-get install -y nginx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 28080

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
