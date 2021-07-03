
#Temporary container
#Tagging this build phase with name as builder
FROM node:alpine as builder
WORKDIR /usr/app
COPY package.json /usr/app
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /usr/app/build /usr/share/nginx/html
#Default cmd for nginx start will work