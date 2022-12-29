FROM ubuntu:latest

WORKDIR /opt/event/authenticator

COPY ./controller/config  .

COPY ./controller/.env .

RUN apt update

RUN chmod +x ./config

ENV PORT 8081

CMD ./config -configPrefix=wedding -configSource=/opt/event/authenticator/.env