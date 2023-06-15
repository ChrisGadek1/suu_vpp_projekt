FROM ubuntu:latest

RUN apt-get update && apt-get install -y iperf iproute2

COPY entrypoint_client.sh /
RUN chmod +x /entrypoint_client.sh

ENTRYPOINT ["/entrypoint_client.sh"]
