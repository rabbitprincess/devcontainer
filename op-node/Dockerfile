FROM golang:latest

# install dependencies
RUN apt update && \
    apt install -y sudo git nano curl cmake libssl-dev libgmp-dev libtinfo5 libprotoc-dev build-essential

RUN go get -u github.com/golang/protobuf/proto

# install nodejs and pnpm
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
RUN apt-get install -y nodejs && npm install -g pnpm

# install foundry
ENV FOUNDRY_VERSION=${FOUNDRY_VERSION:-nightly}
RUN curl -L https://foundry.paradigm.xyz | sudo -E bash -
RUN . ~/.bashrc && foundryup -v "$FOUNDRY_VERSION"
ENV PATH="~/.foundry/bin:${PATH}"

RUN git clone https://github.com/ethereum-optimism/optimism && cd optimism && make build-go

CMD ["tail", "-f", "/dev/null"]