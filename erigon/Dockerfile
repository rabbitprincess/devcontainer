FROM golang:latest

# install dependencies
RUN apt update && \
    apt install -y sudo git nano curl cmake libssl-dev libgmp-dev libtinfo5 libprotoc-dev build-essential

RUN git clone https://github.com/testinprod-io/op-erigon && cd op-erigon && \
    make

CMD ["tail", "-f", "/dev/null"]