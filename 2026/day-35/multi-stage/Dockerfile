FROM node:18 AS builder

WORKDIR /app

COPY package.json .

RUN npm install

#stage 2

FROM node:alpine

WORKDIR /app

COPY --from=builder /app /app

COPY app.js .

EXPOSE 8080

CMD ["node", "app.js"]
