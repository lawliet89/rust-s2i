FROM openshift/base-centos7
MAINTAINER Yong Wen Chua <me@yongwen.xyz>

ENV BUILDER_VERSION 1.14.0

LABEL io.k8s.description="Platform for building Rust Applications" \
     io.k8s.display-name="Rust 1.14.0" \
     io.openshift.expose-services="8080:http" \
     io.openshift.tags="rust" \
     io.openshift.s2i.assemble-input-files="/opt/app-root/src/target/release"

RUN set -x \
    && yum install -y yum install file \
    && curl -sSf https://static.rust-lang.org/rustup.sh > /tmp/rustup.sh \
    && chmod +x /tmp/rustup.sh \
    && /tmp/rustup.sh  --disable-sudo --yes --revision="${BUILDER_VERSION}" \
    && rm /tmp/rustup.sh \
    && yum clean all -y

# Copy the S2I scripts to /usr/libexec/s2i, since openshift/base-centos7 image sets io.openshift.s2i.scripts-url label that way
COPY ./.s2i/bin/ /usr/libexec/s2i
RUN chown -R 1001:1001 /opt/app-root

# This default user is created in the openshift/base-centos7 image
USER 1001
EXPOSE 8080
CMD ["usage"]
