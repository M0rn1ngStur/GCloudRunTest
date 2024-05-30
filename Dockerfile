
# Use the official lightweight Node.js 10 image.
# https://hub.docker.com/_/node
FROM node:17-slim

RUN apt-get -y update;

# Create and change to the app directory.
WORKDIR /usr/src/app

# Copy application dependency manifests to the container image.
# A wildcard is used to ensure both package.json AND package-lock.json are copied.
# Copying this separately prevents re-running npm install on every code change.
COPY package.json .
COPY package-lock.json .

# Install dependencies.
# If you add a package-lock.json speed your build by switching to 'npm ci'.
RUN npm ci
# RUN npm install --production


# Copy local code to the container image.
COPY . ./

EXPOSE 8080

# Run the web service on container startup.
CMD [ "node", "index.js" ]