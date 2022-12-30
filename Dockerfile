FROM ubuntu:latest

WORKDIR /opt/event/authenticator

COPY ./cmd/config  .

COPY ./cmd/.env .

RUN apt update

RUN chmod +x ./config

ENV PORT 8081

CMD ./config -configPrefix=wedding -configSource=/opt/event/authenticator/.env