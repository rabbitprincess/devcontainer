FROM golang:latest

# install dependencies
RUN apt update && \
    apt install -y sudo git nano curl cmake libssl-dev libgmp-dev libtinfo5 libprotoc-dev 

RUN go install github.com/bazelbuild/bazelisk@latest

RUN git clone https://github.com/prysmaticlabs/prysm && cd prysm && \
    bazelisk build //cmd/prysmctl --config=release

CMD ["tail", "-f", "/dev/null"]