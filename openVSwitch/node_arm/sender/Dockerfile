FROM ubuntu:latest

RUN apt-get update
RUN apt install libsctp1
RUN apt-get install iperf

CMD iperf -c receiver-1 -t 60 -u
