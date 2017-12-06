#!/bin/bash

rm ./*input-*

for i in `seq 10000 3000 40000`; do
    ../knapgen.o -n 25 -N 15 -m 0.5 -W 200 -C ${i} -k 1 -d 1 > "input-${i}"
done