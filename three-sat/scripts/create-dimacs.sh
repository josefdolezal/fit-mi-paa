#!/bin/bash
BIN=./dimacsgen

if [ ! -f $BIN ]; then
    echo '👷 Building dimacs generator'
    gcc -w dimacsgen.c -o $BIN
    chmod +x $BIN
fi
