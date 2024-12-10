FROM node:22.11.0-bullseye

USER root

RUN npm i -g npm@latest vercel@latest npm-check-updates
RUN apt-get update && apt-get -y install vim git

COPY ./src /home/node/practice
RUN chown -R node:node /home/node

WORKDIR /home/node/practice

RUN npx playwright install-deps

RUN groupmod -g 1000 node && usermod -u 1000 -g 1000 node
USER node

RUN npx playwright install