#!/bin/bash
# (c) 2016 Andhita Nurul Ainun -- This is free software
# START Fri Dec 30 22:03:00 WIB 2016
#

declare -i n
n=1
sed -n 's/^.*http/http/p' ranking.txt |
while read LINE
do
situs="$(w3m -dump -cols 120 $LINE)"
if [ n < 10 ]; then
 echo "$situs" > "RK-0$n.txt"
else
 echo "$situs" > "RK-$n.txt"
fi
if [ "$n == 7" ]; then
  n=$((n+2))
else
  n=$((n+1))
if [ "$n == 31" ]; then
  n=$((n+2))
else
  n=$((n+1))
if [ "$n == 46" ]; then
  n=$((n+2))
else
  n=$((n+1))
fi
done

