#!/bin/bash

rm ./*input-*

for i in `seq 0.1 0.1 1`; do
    ../knapgen.o -n 27 -N 20 -m ${i} -W 12000 -C 100 -k 1 -d 0 > "input-${i}"
done
