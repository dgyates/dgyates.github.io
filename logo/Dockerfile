FROM debian:stable-slim
LABEL MAINTAINER Sean Donnellan <docker@donnellan.de>
RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		openscad \
  		xvfb \
		xauth \
  	&& rm -rf /var/lib/apt/lists/*
RUN mkdir -p /root/.local/share /.local/share
WORKDIR /opt/app
COPY . .
ENV DISPLAY :99
ENTRYPOINT ["/bin/sh", "-c", "/usr/bin/xvfb-run -a $@", ""]
CMD ["openscad" , "-o" , "test.png" , "--imgsize=1220,1080" , "include-Module-IBMlogo3D.scad"]
