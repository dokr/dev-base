FROM alpine:edge

RUN apk add --update ca-certificates tzdata
ENV TZ=Asia/Shanghai

RUN apk add --update bash curl
