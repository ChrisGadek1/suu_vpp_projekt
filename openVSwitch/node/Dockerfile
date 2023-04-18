FROM ubuntu:latest

RUN apt-get update
RUN apt install libsctp1
RUN apt-get install -y wget 
RUN wget https://iperf.fr/download/ubuntu/libiperf0_3.9-1_amd64.deb
RUN wget https://iperf.fr/download/ubuntu/iperf3_3.9-1_amd64.deb
RUN dpkg -i libiperf0_3.9-1_amd64.deb iperf3_3.9-1_amd64.deb
RUN rm libiperf0_3.9-1_amd64.deb iperf3_3.9-1_amd64.deb
