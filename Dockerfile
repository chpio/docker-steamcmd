FROM debian:jessie

ADD ./fs /
RUN /tmp/install

ENV PATH /opt/steamcmd:$PATH
