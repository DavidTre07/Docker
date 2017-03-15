#FROM quay.io/prometheus/busybox:glibc
#FROM scratch
FROM resin/rpi-raspbian

# Metadata
LABEL org.label-schema.vendor="Prometheus" \
      org.label-schema.url="https://prometheus.io/" \
      org.label-schema.name="Node-Explorer" \
      org.label-schema.description="Exporter for Prometheus" \
      org.label-schema.version="$version" \
      org.label-schema.docker.schema-version="1.0"

ARG version

COPY dd/* /
RUN ln -s /lib/ld-linux-armhf.so.3 /lib/ld-linux.so.3

EXPOSE 9100

ENTRYPOINT ["/node_exporter"]

#On raspberry raspbian there is no hwmon, so monitor all but hwmon
#CMD ["-collectors.enabled", "conntrack,diskstats,entropy,filefd,filesystem,loadavg,mdadm,meminfo,netdev,netstat,sockstat,stat,textfile,time,uname,vmstat"]

