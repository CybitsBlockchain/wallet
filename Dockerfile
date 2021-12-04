FROM node:10.16.2
COPY package*.json /app/
WORKDIR /app
RUN npm install -g cordova ionic@4.10.4 npm@6.11 typescript@4.0.3 && cordova telemetry off
# && echo n | ionic start dockerized-ionic-app --skip-npm --v2 --ts

RUN npm install -D -E @ionic/lab

RUN npm install && npm cache verify
COPY . /app
RUN npm run apply:bitpay
EXPOSE 8100 35729
# CMD ["ionic", "serve", "--all"]
