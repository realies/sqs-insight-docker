from node:alpine
run apk update && apk upgrade && \
 apk add --virtual build-dependencies git && \
 apk add jq && \
 wget https://raw.githubusercontent.com/eficode/wait-for/master/wait-for -O /wait-for && \
 chmod +x /wait-for && \
 git clone https://github.com/kobim/sqs-insight.git && \
 cd /sqs-insight && \
 yarn install && \
 apk del build-dependencies && \
 rm -rf /var/cache/apk/*
copy conf/config.json.* /
copy init.sh /init.sh
workdir /sqs-insight
cmd /init.sh
