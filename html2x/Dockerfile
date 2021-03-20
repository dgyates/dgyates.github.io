# this file exists because Docker Hub can't make images out of build stages
# so this is a bit redundant with Dockerfile in this repo
# but it lets us host two images, mostly the same, on Hub

FROM debian:stable-slim

RUN mkdir /data \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        bash \
        wget curl wkhtmltopdf phantomjs xvfb xauth ca-certificates pandoc \
        texlive texlive-base lmodern \
        netbase aptitude 

WORKDIR /opt/app
COPY html2x.sh .

ENTRYPOINT [ "/bin/bash" ]
CMD ["/opt/app/html2x.sh" , "https://donnels.github.io"]