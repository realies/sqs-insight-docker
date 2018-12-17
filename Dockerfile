from node:alpine
env commit a32e126
run apk update && apk upgrade && \
 apk add --virtual build-dependencies git && \
 apk add jq && \
 git clone -n https://github.com/kobim/sqs-insight.git && \
 cd /sqs-insight && \
 git checkout ${commit} && \
 yarn install && \
 apk del build-dependencies && \
 rm -rf /var/cache/apk/*
copy conf/config.json.* /
copy init.sh /init.sh
workdir /sqs-insight
cmd /init.sh
