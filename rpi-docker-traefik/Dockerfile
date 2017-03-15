FROM scratch

# Metadata
LABEL org.label-schema.vendor="Containous" \
      org.label-schema.url="https://traefik.io" \
      org.label-schema.name="Traefik" \
      org.label-schema.description="A modern reverse-proxy" \    
      org.label-schema.version=TRAEFIK_VERSION \
      org.label-schema.docker.schema-version="1.0"

ADD https://raw.githubusercontent.com/containous/traefik/master/script/ca-certificates.crt /etc/ssl/certs/

COPY traefik_linux-arm /traefik

EXPOSE 80

ENTRYPOINT ["/traefik"]
