FROM node:15-alpine

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

EXPOSE  5000

CMD ["npm","start"]