#!/bin/bash

BIN=$(swift build --configuration=release --show-bin-path)/ThreeSAT
SIZES='15 27 30 32 35 37 40'
TEMPERATURES=$(seq 225 25 350)
EQUILIBRIUMS=$(seq 100 100 500)
ANNEALING_FACTORS='0.8 0.85 0.9 0.95 0.99'

STATIC_ANNEALING_FACTOR=0.95
STATIC_EQUILIBRIUM=400
STATIC_INITIAL_TEMP=400

echo '❌ Removing old measurements'
rm -rf measurement
mkdir Measurement

echo '🏃 Running initial temperature measurement'
for size in $SIZES; do
    echo '  ↳ Measuring size' $size

    for temperature in $TEMPERATURES; do
        fixtures=Fixtures/time-initial-temperature/$temperature/$size/*

        average=$($BIN time $temperature $STATIC_ANNEALING_FACTOR $STATIC_EQUILIBRIUM $fixtures)
        echo -e "${temperature}\t${average}"
    done;
done;

echo '🏃 Running equilibrium measurement'
for size in $SIZES; do
    echo '  ↳ Measuring size' $size

    for equilibrium in $EQUILIBRIUMS; do
        fixtures=Fixtures/time-equilibrium/$equilibrium/$size/*

        average=$($BIN time $STATIC_INITIAL_TEMP $STATIC_ANNEALING_FACTOR $equilibrium $fixtures)
        echo -e "${equilibrium}\t${average}"
    done;
done;

echo '🏃 Running annealing factor measurement'
for size in $SIZES; do
    echo '  ↳ Measuring size' $size

    for factor in $ANNEALING_FACTORS; do
        fixtures=Fixtures/time-annealing-factors/$factor/$size/*
    
        average=$($BIN time $STATIC_INITIAL_TEMP $factor $STATIC_EQUILIBRIUM $fixtures)
        echo -e "${factor}\t${average}"
    done;
done;
