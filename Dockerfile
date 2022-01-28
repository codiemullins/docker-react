FROM node:16-alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build <-- directory of stuff we care about

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
