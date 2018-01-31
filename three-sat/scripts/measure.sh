#!/bin/bash

BIN=$(swift build --configuration=release --show-bin-path)/ThreeSAT
SIZES='27 30 32 35 37 40'
TEMPERATURES=$(seq 225 25 350)
EQUILIBRIUMS=$(seq 100 100 500)
ANNEALING_FACTORS='0.8 0.85 0.9 0.95 0.99'

STATIC_ANNEALING_FACTOR=0.95
STATIC_EQUILIBRIUM=400
STATIC_INITIAL_TEMP=400

echo '❌ Removing old measurements'
rm -rf measurement
mkdir Measurement

echo '📈 Prepairing for initial temperature measurement'
for size in $SIZES; do echo "$size" >> Measurement/initial-temperatures.dat; done

echo '🏃 Running initial temperature measurement'
for size in $SIZES; do
    echo '  ↳ Measuring size' $size
    temp=''

    for temperature in $TEMPERATURES; do
        fixtures=Fixtures/time-initial-temperature/$temperature/$size/*

        average=$($BIN time $temperature $STATIC_ANNEALING_FACTOR $STATIC_EQUILIBRIUM $fixtures)
        echo -e "${temperature}\t${average}"
        temp="${temp}${average}\n"
    done;

    result=$(paste -d '\t' Measurement/initial-temperatures.dat <(echo -e "$temp"))
    echo -e "$result" > Measurement/initial-temperatures.dat
done;

echo '📈 Prepairing for equilibrium measurement'
for size in $SIZES; do echo "$size" >> Measurement/equilibriums.dat; done

echo '🏃 Running equilibrium measurement'
for size in $SIZES; do
    echo '  ↳ Measuring size' $size
    temp=''

    for equilibrium in $EQUILIBRIUMS; do
        fixtures=Fixtures/time-equilibrium/$equilibrium/$size/*

        average=$($BIN time $STATIC_INITIAL_TEMP $STATIC_ANNEALING_FACTOR $equilibrium $fixtures)
        echo -e "${equilibrium}\t${average}"
        temp="${temp}${average}\n"
    done;

    result=$(paste -d '\t' Measurement/equilibriums.dat <(echo -e "$temp"))
    echo -e "$result" > Measurement/equilibriums.dat
done;

echo '📈 Prepairing for factor measurement'
for size in $SIZES; do echo "$size" >> Measurement/factors.dat; done

echo '🏃 Running annealing factor measurement'
for size in $SIZES; do
    echo '  ↳ Measuring size' $size
    temp=''

    for factor in $ANNEALING_FACTORS; do
        fixtures=Fixtures/time-annealing-factors/$factor/$size/*
    
        average=$($BIN time $STATIC_INITIAL_TEMP $factor $STATIC_EQUILIBRIUM $fixtures)
        echo -e "${factor}\t${average}"
        temp="${temp}${average}\n"
    done;

    result=$(paste -d '\t' Measurement/factors.dat <(echo -e "$temp"))
    echo -e "$result" > Measurement/factors.dat
done;
