#!/bin/bash
# (c) 2016 Andhita Nurul Ainun -- This is free software
# START Tue Jan 03 21:34:00 WIB 2016
# REV01 Wed Jan 04 02:10:00 WIB 2017
# REV02 Web Jan 04 04:12:00 WIB 2017
# kode ini pertama kali untuk memisahkan "AA. [UB-CC]" dan mengubahnya menjadi "U B CC AA" menggunakan grep dan awk kemudian hasilnya disimpan ke XHASIL.txt
# berkas XHASIL.txt disortir menggunakan sort dengan sortir mulai dari kolom 2(B), 3(CC) sampai kolom 4(AA) kemudian hasilnya masuk kedalam YHASIL.txt
# berkas dalam YHASIL.txt dicek tiap baris kemudian dilakukan grep dengan baris pada temp.txt. Hasil grep diambil kolom ke 4 dan disimpan ke temp2.txt yang kemudian diubah ke bentuk kolom menggunakan sed lalu disimpan dalam temp3.txt. Berkas temp3 menggunakan awk untuk append baris yang sedang di loop dengan hasil temp2.txt sebelumnya. Hasilnya kemudian dimasukkan ke ZHASIL.txt 



cat RK-*.txt | grep http | awk -F "." '{print $1 " " $2}'| awk -F "]" '{print $1}' | grep "-" | awk -F "[" '{print $1$2}' | awk -F "-" '{print $1 " " $2}' | awk -F "U" '{print $1$2}' | awk -F " " '{print $2 " " $3 " " $1}' | awk '{ if ($1 ~ /^[0-9 ]*$/) print }' | awk '{print "U " $0}' > XHASIL.txt

cat XHASIL.txt | sort -k2,4 > YHASIL.txt

cat YHASIL.txt | sort -u -k1,3 | awk -F " " '{print $1 " " $2 " " $3}' > temp.txt

cp /dev/null ZHASIL.txt
while read line
do
   cat YHASIL.txt | grep "$line" | awk -F " " '{print $4}' > temp2.txt
   sed -n '1h;1!H;${g;s/\n/ /g;p}' temp2.txt > temp3.txt
   awk -v prefix="$line" '{print prefix " " $0}' temp3.txt >> ZHASIL.txt
done < temp.txt

