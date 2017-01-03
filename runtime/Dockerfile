FROM centos:7
MAINTAINER Yong Wen Chua <me@yongwen.xyz>

LABEL io.openshift.s2i.assemble-input-files="/opt/app-root/src/target/release" \
      io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"

WORKDIR /opt/app-root
COPY ./.s2i/bin/ /usr/libexec/s2i
