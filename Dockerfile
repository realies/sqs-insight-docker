FROM node:alpine
ARG COMMIT=d6f264b
RUN apk update && apk upgrade && \
 apk add --virtual build-dependencies git && \
 apk add jq && \
 git clone -n https://github.com/kobim/sqs-insight.git && \
 cd /sqs-insight && \
 git checkout ${COMMIT} && \
 yarn install && \
 apk del build-dependencies && \
 rm -rf /var/cache/apk/*
COPY conf/config.json.* /
COPY init.sh /init.sh
WORKDIR /sqs-insight
CMD /init.sh
