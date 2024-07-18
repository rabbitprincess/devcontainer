FROM golang:latest

# install dependencies
RUN apt-get -y update && apt-get install -y sudo jq wget curl gnupg git make bc ca-certificates && \
    sudo rm -rf /var/lib/apt/lists
    
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