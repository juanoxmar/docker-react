FROM node:alpine
WORKDIR '/app'
COPY package.json ./
COPY yarn.lock ./
RUN yarn install
COPY ./ ./
RUN yarn build

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html