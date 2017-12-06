#!/bin/bash

rm ./*input-*

for i in `seq 7000 500 15000`; do
    ../knapgen.o -n 23 -N 15 -m 0.2 -W $i -C 500 -k 1 -d 0 > "input-${i}"
done