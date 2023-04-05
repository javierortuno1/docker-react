
# -------------------Builder Phase---------------
FROM node:16-alpine as builder

USER node

RUN mkdir -p /home/node/app
WORKDIR /home/node/app

COPY --chown=node:node ./package.json ./
RUN npm install

# Import or copy all the files (FS Snapshot) inside the container
COPY --chown=node:node ./ ./
RUN npm run build

# The build folder is in /home/node/app/build

# ----------------------Server Phase -----------------------
FROM nginx
COPY --from=builder /home/node/app/build /usr/share/nginx/html
# By default Nginx container image is by default start



