### BASE
# FROM node:12.20.1-alpine3.12
FROM mhart/alpine-node:12.22.1

# Set the working directory
WORKDIR /app

RUN apk upgrade --no-cache -U && \
  apk add --no-cache make gcc g++ python3 git \
  && yarn global add node-gyp \
  && rm -rf /var/cache/apk/*

# Install yarn
# RUN npm install -g yarn
# RUN apt-get update -y && apt-get install -y libusb-1.0-0 libusb-1.0-0-dev libudev-dev

# Copy project specification and dependencies lock files
ONBUILD COPY package.json yarn.lock ./
ONBUILD ADD types /app/types
# ONBUILD ADD src/npm-patches /app/src/npm-patches

# overwrite this with 'CMD []' in a dependent Dockerfile
CMD ["/bin/bash"]
