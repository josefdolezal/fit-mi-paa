#!/bin/bash

rm ./*input-*

for i in `seq 200 200 3000`; do
    ../knapgen.o -n 50 -N 15 -m 0.5 -W $i -C 35 -k 1 -d 0 > "input-${i}"
done