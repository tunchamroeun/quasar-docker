FROM node:alpine as builder

WORKDIR /app

COPY package.json .

RUN yarn global add @quasar/cli

RUN yarn install

COPY . .

RUN quasar build

FROM nginx
EXPOSE 80
COPY --from=builder /app/dist/spa /usr/share/nginx/html