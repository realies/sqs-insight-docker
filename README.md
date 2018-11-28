## Typical Usage

##### Using Docker CLI
```
docker run -d --name sqs-insight \
-e mode=endpoint \
-e key=notValidKey \
-e secretKey=notValidSecret \
-e region=eu-central-1 \
-e url=http://sqs.amazonaws.com/my-user/my-queue \
-p 3000:3000 \
realies/sqs-insight
```
or
```
docker run -d --name sqs-insight \
-e mode=dynamicEndpoint \
-e key=notValidKey \
-e secretKey=notValidSecret \
-e region=us-east-1 \
-e url=http://sqs.amazonaws.com/ \
-p 3000:3000 \
realies/sqs-insight
```
or
```
docker run -d --name sqs-insight \
-v "$(PWD)"/config_local.json:/sqs-insight/config/config_local.json \
-p 3000:3000 \
realies/sqs-insight
```
##### Using Docker Compose
```
docker-compose up -d
```
