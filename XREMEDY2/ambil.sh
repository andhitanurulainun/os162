#
#(c) 2016 Andhita Nurul Ainun -- This is free software
#START Thursday  Dec 29 13:03:00 WIB 2016
#script ini terlebih dahulu melakukan ekstraksi situs kemudian menghilangkan baris yang mengandung [DISK] menggunakan sed, lalu dilanjutkan untuk mengambil daftar ranking yang berada diantara ZCZC dan NNNN menggunakan sed juga dan setelah didapatkan daftar ranking tanpa [DISK] dan tanpa character "[]", output dimasukkan kedalam ranking.txt



situs="$(w3m -dump http://os162.vlsm.org/2016/11/ranking-os162.html)"
echo "$situs" > x
sed '/DISK/,+0 d' x > y
sed -n '/ZCZC/,/NNNN/p' y > z
sed '/ZCZC/,+0 d' z > z1
sed '/NNNN/,+0 d' z1 > z2
sed 's/\[//' z2 > z3
sed 's/\]//' z3 > ranking.txt 
start="========================================================================= START BERKAS"
stop="========================================================================== STOP BERKAS"
echo "$start$(cat ranking.txt)" > ranking.txt
echo "$stop" >> ranking.txt

