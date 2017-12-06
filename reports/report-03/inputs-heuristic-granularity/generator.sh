#!/bin/bash

rm ./*input-*

for i in `seq 0 1 6`; do
    ../knapgen.o -n 20 -N 20 -m 0.5 -W 30 -C 100 -k ${i} -d 1 > "input-${i}"
done
