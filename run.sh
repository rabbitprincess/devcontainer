#!/bin/bash

docker build -t prysm-workspace .
docker run -itd -v $(pwd):/workspace prysm-workspace

# docker exec -it prysm-workspace /bin/bash