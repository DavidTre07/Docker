FROM scratch

ARG version

# Metadata
LABEL org.label-schema.url="https://prometheus.io/" \
      org.label-schema.name="Prometheus" \
      org.label-schema.description="Monitoring system" \
      org.label-schema.version=$version \
      org.label-schema.docker.schema-version="1.0"

WORKDIR /

#Prometheus is already prepared in a folder with the rights paths so we use standard paths
COPY dd/bin /bin
COPY dd/etc /etc
COPY dd/usr /usr
COPY dd/* /

EXPOSE 9090

VOLUME [ "/prometheus" ]
WORKDIR /prometheus

ENTRYPOINT [ "/bin/prometheus" ]

CMD        [ "-config.file=/etc/prometheus/prometheus.yml", \
             "-storage.local.path=/prometheus", \
             "-web.console.libraries=/usr/share/prometheus/console_libraries", \
             "-web.console.templates=/usr/share/prometheus/consoles" ]
