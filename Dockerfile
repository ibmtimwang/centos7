FROM registry.redhat.io/rhel7/support-tools

RUN INSTALL_PKGS="unzip" && \
    microdnf -y install $INSTALL_PKGS && \
    rpm -V --nosize --nofiledigest --nomtime $INSTALL_PKGS && \
    microdnf clean all && \
    rm -rf /usr/local/man

RUN unzip -h
