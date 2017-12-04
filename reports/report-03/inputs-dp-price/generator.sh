#!/bin/bash

rm ./*input-*

for i in `seq 0 10000 100000`; do
    ../knapgen.o -n 50 -N 15 -m 0.5 -W 200 -C ${i} -k 1 -d 0 > "input-${i}"
done