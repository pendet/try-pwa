FROM node:lts-alpine

RUN apk update && apk add bash

WORKDIR /home/app
COPY package.json package-lock.json* ./
RUN npm cache clean --force && npm install

COPY . /home/app

ENV PORT 8080
EXPOSE 8080

CMD [ "npm", "run", "start" ]