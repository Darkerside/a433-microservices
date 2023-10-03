FROM node:14 
WORKDIR /app
COPY . .
ENV NODE_ENV=production DB_HOST=item-db
RUN npm install --production --unsafe-perm && npm run build
EXPOSE 8080
CMD npm start

####
# COMMENT SECTION HERE
# 
# FROM node:14                              >> ambil image dari repository dengan nama node dan versi 14 
# WORKDIR /app                              >> set workdir dari docker image ke folder /app
# COPY . .                                  >> copy semua file dari folder / lokasi yang sama dengan file Dockerfile ini kedalam folder /app pada docker image
# ENV NODE_ENV=production DB_HOST=item-db   >> set ENV value untuk Node JS
# RUN npm install --production --unsafe-perm && npm run build     >> Menjalankan perintah setelah melakukan semua perintah diatas, perintah ini bertujuan untuk mengeksekusi perintah nodejs pada docker image
# EXPOSE 8080                               >> Buka port 8080 agar NodeJS didalam Docker image dapat diakses dari luar melalui port yang dibuka
# CMD npm start                             >> Perintah ini bertujuan untuk menjalankan aplikasi NodeJS pada Docker Image
####