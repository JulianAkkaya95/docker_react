FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /user/share/nginx/html
COPY /site.conf /etc/nginx/conf.d/site.conf

