FROM debian:stable-slim
MAINTAINER Sean Donnellan <docker@donnellan.de>
RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		openscad \
  		xvfb \
		xauth \
  	&& rm -rf /var/lib/apt/lists/*
RUN mkdir -p /root/.local/share /.local/share
WORKDIR /opt
WORKDIR /opt/app
ENV DISPLAY :99
ENTRYPOINT ["/bin/sh", "-c", "/usr/bin/xvfb-run -a $@", ""]
