#!/bin/bash

rm ./*input-*

for i in `seq 0 1 10`; do
    ../knapgen.o -n 50 -N 15 -m 0.5 -W 200 -C 35 -k ${i} -d 0 > "input-${i}"
done
