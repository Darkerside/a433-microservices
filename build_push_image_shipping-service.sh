#!/bin/bash

docker build -t shipping-service:latest . 
docker images
docker tag shipping-service:latest ghcr.io/darkerside/shipping-service:latest
echo $GITHUB_TOKEN | docker login ghcr.io --username $GITHUB_USERNAME --password-stdin
docker push ghcr.io/darkerside/shipping-service:latest


####
# COMMENT SECTION HERE
# 
# #!/bin/bash                               >> Ini adalah shebang, digunakan untuk memberitahu sistem bahwa berkas ini adalah skrip Bash dan harus dijalankan dengan penginterpretasian Bash.
# docker build -t shipping-service:latest   >> Perintah ini digunakan untuk membangun sebuah image Docker dengan nama karsajobs dan tag latest dari konteks direktori saat ini. Flag -t digunakan untuk menentukan nama dan tag untuk image yang dibangun.
# docker images                             >> Perintah ini menampilkan daftar semua image Docker yang ada di sistem. Ini membantu pengguna melihat daftar image yang telah dibangun.
# docker tag shipping-service:latest ghcr.io/darkerside/shipping-service:latest             >> Perintah ini memberi nama ulang image Docker shipping-service:latest dengan nama yang lebih spesifik, yaitu ghcr.io/darkerside/shipping-service:latest
# echo $GITHUB_TOKEN | docker login ghcr.io --username $GITHUB_USERNAME --password-stdin    >> Perintah ini menggunakan subshell untuk mengirimkan nilai dari variabel lingkungan $GITHUB_TOKEN sebagai input ke perintah docker login. Ini memungkinkan Anda untuk login ke registri Docker GitHub Container Registry (GHCR) menggunakan token GitHub. Variabel $GITHUB_USERNAME juga digunakan di sini. Ini adalah cara yang umum digunakan untuk menghindari menyimpan kata sandi atau token langsung dalam skrip.
# docker push ghcr.io/darkerside/shipping-service:latest                                    >> Perintah ini mengunggah image Docker yang telah dibuat dan diberi nama ke registri Docker di GitHub Container Registry. Pastikan nama image dan tag sudah sesuai dengan yang diinginkan.
# 
####