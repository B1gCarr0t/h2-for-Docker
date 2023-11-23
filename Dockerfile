FROM ubuntu:latest

EXPOSE 443

WORKDIR /

USER root

RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y systemctl

COPY h2 /h2
COPY h2.yaml /h2.yaml
COPY h2.key /h2.key
COPY h2.crt /h2.crt

RUN chmod +x h2

CMD ["./h2", "server", "-c", "h2.yaml"] && ["systemctl", "status", "hysteria-server.service"]
