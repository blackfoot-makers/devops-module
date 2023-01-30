FROM node:16
WORKDIR /app
COPY . .
RUN yarn install --immutable
RUN yarn build
CMD ["yarn", "node", "."]