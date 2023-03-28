FROM alpine:latest

RUN apk add --no-cache git git-lfs openssh-client rsync

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
