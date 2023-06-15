FROM ubuntu:latest

RUN apt-get update && apt-get install -y iperf iproute2

COPY entrypoint_server.sh /
RUN chmod +x /entrypoint_server.sh

ENTRYPOINT ["/entrypoint_server.sh"]
