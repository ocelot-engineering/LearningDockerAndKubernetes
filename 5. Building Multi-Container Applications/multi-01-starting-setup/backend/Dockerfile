FROM node

WORKDIR /app

COPY package.json /app

RUN npm install

COPY . /app

ENV MONGODB_USERNAME=mongoadmin

ENV MONGODB_PASSWORD=unknown

CMD ["npm", "start"]
