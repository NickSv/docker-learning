FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build    folder with final build files needed for production server

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html