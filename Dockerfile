FROM node:20.9.0-alpine

WORKDIR /app

COPY ./package.json .
COPY ./package-lock.json .

RUN npm install && npm cache clean --force
RUN npm i --save-dev @types/bcryptjs

COPY . .

RUN npm run build

EXPOSE 80

CMD [ "npm", "start" ]