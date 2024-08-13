FROM node:lts as builder
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y
RUN apt-get update && apt-get install python3.11-venv -y
# RUN yarn add transparent-background && rm -rf /root/.cache/
WORKDIR /app
COPY package.json yarn.lock ./
COPY beautifulImages/ ./beautifulImages/
COPY transparent-background.js .
RUN npm install && node transparent-background.js && rm -rf /root/.cache/ node_modules

FROM node:lts-alpine
WORKDIR /app
RUN mkdir /data/
COPY --from=builder /app/beautifulImages-removebg/ /app/beautifulImages-removebg/
