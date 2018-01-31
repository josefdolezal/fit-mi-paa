BIN=./dimacsgen
SIZES='17 20 22 25'
INSTANCE_SEQ=$(seq 1 20)
STATIC_MAX_PRICE=150
STATIC_CLAUSES=25
TEMPERATURES=$(seq 125 25 250)
EQUILIBRIUMS=$(seq 100 100 500)
ANNEALING_FACTORS='0.8 0.85 0.9 0.95 0.99'

function dimacs() {
    VARIABLES=$1
    CLAUSES=$2
    MAX_PRICE=$3
    OUT=$4

    $BIN $VARIABLES $CLAUSES $MAX_PRICE > $OUT
}

echo '❌ Removing old inputs'
rm -rf Fixtures
mkdir Fixtures

echo '📂 Generating instances for initial temperature'
for size in $SIZES; do
    for temperature in $TEMPERATURES; do
        for i in $INSTANCE_SEQ; do
            dir=Fixtures/time-initial-temperature/${temperature}/${size}
            mkdir -p $dir
            dimacs $size $STATIC_CLAUSES $STATIC_MAX_PRICE $dir/${i}
        done;
    done;
done;

echo '📂 Generating instances for equilibrium'
for size in $SIZES; do
    for equilibrium in $EQUILIBRIUMS; do
        for i in $INSTANCE_SEQ; do
            dir=Fixtures/time-quilibrium/${equilibrium}/${size}
            mkdir -p $dir
            dimacs $size $STATIC_CLAUSES $STATIC_MAX_PRICE $dir/${i}
        done;
    done;
done;

echo '📂 Generating instances for annealing factors'
for size in $SIZES; do
    for factor in $ANNEALING_FACTORS; do
        for i in $INSTANCE_SEQ; do
            dir=Fixtures/time-annealing-factors/${factor}/${size}
            mkdir -p $dir
            dimacs $size $STATIC_CLAUSES $STATIC_MAX_PRICE $dir/${i}
        done;
    done;
done;
