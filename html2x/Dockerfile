# Docker Image to print web pages to PDF and other formats
#
# phantomjs is an orphaned package that works quite well with some quirks but can produce PDF
# pandoc works best so far and produced both word and pdf if required but ignores the js in the page
# - this drops the badges and the js elements that are as such needed
# - It' still the best overall result (hence locked in the entrypoint and CMD)
# wkhtmltopdf is neutered in this install and while it can produce pdf it's second choice right now
#  - above also requires xvfb unless patched so it's also included plus xauth
# wget and curl can archive pages so are good to GET pages but not essential for converting
# chromium has a headless mode that I'm experimenting with now and can expose a debug port OR print to pdf
# netbase was require by phantomjs (I think)

FROM debian:stable-slim as base
#install the base packages that change infrequently
        RUN mkdir /data \
            && apt-get update \
            && apt-get install -y --no-install-recommends \
                bash \
                wget curl ca-certificates

FROM base as basetools
#install the base packages that change infrequently
        RUN apt-get install -y --no-install-recommends \
                netbase aptitude 

FROM basetools as basewkhtml
#install the base packages that change infrequently
        RUN apt-get install -y --no-install-recommends \
                wkhtmltopdf xvfb xauth

FROM basewkhtml as basephantomjs
#install the base packages that change infrequently
        RUN apt-get install -y --no-install-recommends \
                phantomjs

FROM basephantomjs as basepandoc
#install the base packages that change infrequently
        RUN apt-get install -y --no-install-recommends \
                pandoc texlive texlive-base lmodern

FROM basepandoc as tests
# install the packages we're testing around with
        RUN apt-get install -y --no-install-recommends \
                chromium

FROM tests
# change across to the WD and populate it
# do this last as it has the least impact on build time       
        WORKDIR /opt/app
        COPY . .
# Finish up and provide an interface to the container
        EXPOSE 8888/tcp
        ENTRYPOINT [ "/bin/bash" ]
        # CMD ["/opt/app/html2x.sh" , "https://donnels.github.io"]
        CMD ["/opt/app/chromium.sh"]