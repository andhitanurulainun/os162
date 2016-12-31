#!/bin/bash
# (c) 2016 Andhita Nurul Ainun -- This is free software
# START Fri Dec 30 22:03:00 WIB 2016
# program ini terlebih dahulu mengambil list situs tanpa keterangan nomor, kemudian mengambil situs perbaris yang kemudian di lakukan dump lalu dimasukkan kedalam file yang berkesesuaian menggunakan loop. jika dump gagal, dimasukkan kedalam RK-XX-GAGAL.txt


#simpan link saja
a="$(awk '{print $3}' ranking.txt)"

#simpan RK-XX
b="$(awk '{print $2}' ranking.txt)"


arrSitus=()
arrNomor=()

for val in $a; do
arrSitus+=("$val")
done

for val2 in $b; do
arrNomor+=("$val2")
done

for (( i=0; i<${#arrNomor[@]}; i++ )); do 
      link="$(w3m -dump ${arrSitus[i]})"
      if [ -z "$link" ]; then
	 touch "${arrNomor[i]}-GAGAL.txt"
      else
       w3m -dump -cols 120 ${arrSitus[1]} > "${arrNomor[i]}.txt" 
       fi 	  
done  
