FROM openshift/base-centos7
MAINTAINER Yong Wen Chua <me@yongwen.xyz>

LABEL io.k8s.description="Platform for building Rust Applications" \
     io.k8s.display-name="Rust 1.14.0" \
     io.openshift.expose-services="8080:http" \
     io.openshift.tags="rust" \
     io.openshift.s2i.assemble-input-files="/opt/app-root/src/target/release"

ENV RUST_VERSION 1.15.1

RUN set -x \
    && yum install -y \
                      file \
                      cmake \
    && curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain ${RUST_VERSION} \
    && yum clean all -y
ENV PATH /opt/app-root/src/.cargo/bin:$PATH

COPY ./.s2i/bin/ /usr/libexec/s2i

RUN chown -R 1001:1001 /opt/app-root

# This default user is created in the openshift/base-centos7 image
USER 1001
CMD ["usage"]
