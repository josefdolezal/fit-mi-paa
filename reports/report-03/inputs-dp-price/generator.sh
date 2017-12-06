#!/bin/bash

rm ./*input-*

for i in `seq 10000 1000 20000`; do
    ../knapgen.o -n 27 -N 15 -m 0.5 -W 200 -C ${i} -k 1 -d 0 > "input-${i}"
done