# Create node.js app
FROM node:14 AS build

WORKDIR /app

COPY package*.json ./
RUN npm install
COPY . .

# Config nginx
FROM nginx:alpine

COPY --from=build /app /app
COPY nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
