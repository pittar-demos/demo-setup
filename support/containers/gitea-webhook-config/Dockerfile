FROM registry.access.redhat.com/ubi8/ubi-minimal:latest

WORKDIR /tea

ADD gitea-bootstrap.sh /usr/local/bin/

RUN microdnf -y install jq && \
    microdnf -y clean all && \
    chmod +x /usr/local/bin/gitea-bootstrap.sh && \
    chown -R 1001:0 /tea && \
    chmod -R ug+rwx /tea

USER 1001

ENV HOME=/tea

CMD ["/usr/local/bin/gitea-bootstrap.sh"]