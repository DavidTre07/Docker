FROM scratch

ARG version

# Metadata
LABEL org.label-schema.vendor="Portainer" \
      org.label-schema.url="http://portainer.io/" \
      org.label-schema.name="Portainer" \
      org.label-schema.description="Tool for Docker administration" \
      org.label-schema.version="$version" \
      org.label-schema.docker.schema-version="1.0"

COPY dd /

VOLUME /data

EXPOSE 9000

ENTRYPOINT ["/portainer"]
