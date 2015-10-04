FROM debian:latest

ADD ./fs /
RUN /tmp/install

ENV PATH /opt/steamcmd:$PATH
