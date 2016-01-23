FROM debian:jessie

RUN { \
	set -ex; \
	apt-get update; \
	apt-get install -y lib32gcc1; \
	rm -r /var/lib/apt/lists/*; \
}

ADD ./fs /
RUN /tmp/install

ENV PATH /opt/steamcmd:$PATH
