#!/bin/bash
# (c) 2016 Andhita Nurul Ainun -- This is free software
# START Fri Dec 30 22:03:00 WIB 2016
# program ini terlebih dahulu mengambil list situs tanpa keterangan nomor dan dimasukkan kedalam array, kemudian mengambil nomor masing-masing situs perbaris yang dimasukkan juga kedalam array. Setelah itu di lakukan for loop untuk dump lalu dimasukkan kedalam file yang berkesesuaian dengan nomor situsnya. dilakukan juga pengecekan jika dump gagal,yang kemduian dimasukkan kedalam RK-XX-GAGAL.txt


arrSitus=()
arrNomor=()

for val in $(awk '{print $3}' ranking.txt); do
arrSitus+=("$val")
done

for val2 in $(awk '{print $2}' ranking.txt); do
arrNomor+=("$val2")
done

for (( i=0; i<${#arrNomor[@]}; i++ )); do 
      link="$(w3m -dump -cols 2000 ${arrSitus[i]})"
      if [ -z "$link" ]; then
	touch "${arrNomor[i]}-GAGAL.txt"
      else
       w3m -dump -cols 2000 ${arrSitus[i]} > "${arrNomor[i]}.txt" 
       fi 	  
done  
