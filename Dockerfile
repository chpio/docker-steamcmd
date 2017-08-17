FROM chpio/gosu:stretch

RUN { \
	set -ex; \
	apt-get update; \
	apt-get install --no-install-recommends -y lib32gcc1 ca-certificates; \
	rm -r /var/lib/apt/lists/*; \
}

ENV PATH /opt/steamcmd:$PATH

RUN { \
	set -ex; \
	apt-get update; \
	apt-get install -y wget; \

	# install steamcmd
	mkdir -p /opt/steamcmd; \
	cd /opt/steamcmd; \
	wget -qO- "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" \
		| tar -xz --no-same-owner --no-same-permissions; \
	chmod 555 /opt/steamcmd/* -R; \

	# download updates
	steamcmd.sh +quit; \

	# clean up
	apt-get purge -y wget; \
	apt-get autoremove -y; \
	apt-get clean; \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /root/Steam/logs; \
}
