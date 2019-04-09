FROM debian:buster-slim

LABEL MAINTAINER "Swoopla <p.vibet@gmail.com>"

ARG DEBIAN_FRONTEND=noninteractive

COPY files /

ENV \
  SOURCE_SRV="ftp.debian.org" \
  SOURCE_DIR=/ \
  DIST="stretch" \
  SECTION="main contrib non-free" \
  ARCH="i386,amd64" \
  METHOD="https" \
  MIRRORDIR="/debmirror" \
  CONFDIR="/status" \
  DEBUGFILE="/log/debmirror/debug.log"

RUN \
  apt-get update && apt-get install -o Dpkg::Options::=--force-confdef -y debmirror xz-utils apt-transport-https && \
  chmod 0755 /debmirror_sync.sh && \
  mkdir -p ${CONFDIR} && \
  chmod 0777 ${CONFDIR} && \
  mkdir -p ${MIRRORDIR} && \
  chmod 0777 ${MIRRORDIR}

CMD /debmirror_sync.sh

