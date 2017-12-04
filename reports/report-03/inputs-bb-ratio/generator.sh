#!/bin/bash

rm ./*input-*

for i in `seq 0.1 0.1 1`; do
    ../knapgen.o -n 50 -N 15 -m ${i} -W 200 -C 35 -k 1 -d 0 > "input-${i}"
done
