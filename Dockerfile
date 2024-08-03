FROM node:lts
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y
RUN apt-get update && apt-get install python3.11-venv -y
RUN yarn add transparent-background && rm -rf /root/.cache/

