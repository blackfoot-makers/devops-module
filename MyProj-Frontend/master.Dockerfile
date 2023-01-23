FROM node:16 as build
WORKDIR /app
COPY . .
RUN yarn install
RUN yarn build

FROM nginx:latest
COPY --from=build /app/build/ /usr/share/nginx/html

