FROM alpine:3.6

ARG GRAPHITE_API_VERSION=1.1.3
RUN apk add --no-cache python python-dev py-pip git gcc musl-dev &&\
    apk add --no-cache python libffi-dev cairo &&\
    pip install --no-cache-dir -U pip setuptools &&\
    pip install --no-cache-dir cffi &&\
    pip install --no-cache-dir graphite-api==${GRAPHITE_API_VERSION} gunicorn &&\
    apk del  --no-cache python-dev musl-dev libffi-dev gcc &&\
    rm -rf /tmp/*

VOLUME /opt/graphite/storage/whisper

EXPOSE 8080

ADD run.sh /

ENTRYPOINT ["/run.sh"]
