FROM debian:latest

ADD image /
RUN /opt/install

ENV PATH /opt/steamcmd:$PATH
