FROM alpine:3.4
MAINTAINER Boney Bun <boney.bun@gmail.com>

WORKDIR /
RUN apk add --no-cache \
  #linux-headers \
  build-base \
  git \
  python \
  python-dev \
  py-pip \
  libxslt-dev \
  libxml2-dev \
  postgresql-dev \
  && git clone https://github.com/geopython/pycsw.git

RUN apk add --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted \
  geos


WORKDIR /pycsw
RUN mkdir /pycsw/XML
RUN pip install -e .

COPY default.cfg default.cfg

EXPOSE 8000
CMD ["python", "/pycsw/pycsw/wsgi.py"]

# The below commands will be executed from within Makefile
# RUN pycsw-admin.py -c setup_db -f pycsw.cfg
# RUN pycsw-admin.py -c load_records -f pycsw.cfg -p /pycsw/XML/
