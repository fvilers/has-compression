FROM alpine
LABEL maintainer "Fabian Vilers <fabian.vilers@dev-one.com>"

RUN apk update && apk add --update bash curl bc && rm -rf /var/cache/apk/*
COPY has-compression.sh /usr/local/bin
RUN chmod u+x /usr/local/bin/has-compression.sh

ENTRYPOINT [ "/usr/local/bin/has-compression.sh" ]
