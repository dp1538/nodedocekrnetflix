FROM node:latest
WORKDIR /myapp
ADD . .
RUN npm install
CMD ["node", "app.js"]
