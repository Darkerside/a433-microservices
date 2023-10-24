FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN apk add --no-cache bash
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh
RUN chmod +x /bin/wait-for-it.sh
RUN npm install
COPY . .
EXPOSE 3001
CMD [ "npm", "run", "start" ]

####
# COMMENT SECTION HERE
# 
# FROM node:18-alpine               >> Ambil Base Image dari Node:18-alpine 
# WORKDIR /app                      >> Set Working Directories Container ke lokasi /app
# COPY package*.json ./             >> Salin semua file dengan nama 'package' dilanjut dengan wildcard lalu memiliki extensi '.json' ke lokasi Workdir 
# RUN apk add --no-cache bash       >> Install bash Shell kedalam Container agar dapat menjalankan bash scripting yang diperlukan nanti
# RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh   >> Download wait-for-it script, ini merupakan script populer untuk mengecek dan menunggu sebuah service telah siap untuk digunakan.
# RUN chmod +x /bin/wait-for-it.sh  >> Menambahkan izin Eksekusi Script pada file script wait-for-it.sh agar dapat dijalankan oleh bash shell 
# RUN npm install                   >> Jalankan perintah NPM Install didalam Container
# COPY . .                          >> Salin semua file dari Lokasi sekarang kedalam folder lokasi Workdir di Container
# EXPOSE 3000                       >> Ekpose port Container 3000 agar dapat diakses dari luar Container
# CMD [ "npm", "run", "start" ]     >> Jalankan Aplikasi menggunakan perintah 'npm run start'
# 
####
