
# Use the official lightweight Node.js image.
# https://hub.docker.com/_/node
FROM node:latest
# Create and change to the app directory.
WORKDIR /usr/src/app

# Copy application dependency manifests to the container image.
# A wildcard is used to ensure copying both package.json AND package-lock.json (when available).
# Copying this first prevents re-running npm install on every code change.
COPY package*.json ./

# Install dependencies.
# if you need a deterministic and repeatable build create a
# package-lock.json file and use npm ci:
# RUN npm ci --omit=dev
# if you need to include development dependencies during development
# of your application, use:
# RUN npm install --dev

RUN npm ci

# Copy local code to the container image.
COPY . ./

EXPOSE 8080
# Run the web service on container startup.
CMD [ "npm", "start" ]