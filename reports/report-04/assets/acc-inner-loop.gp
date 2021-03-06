set terminal png
set key left top
set xlabel "počet předmětů (n)"
set ylabel "relativní odchylka (%)"
set style fill solid 1.00 border
set xrange [0:45]
set boxwidth 1.2
plot "acc-inner-loop.txt" using 1:2 title 'k=100' with lp, \
     "acc-inner-loop.txt" using 1:3 title "k=200" with lp, \
     "acc-inner-loop.txt" using 1:4 title "k=300" with lp, \
     "acc-inner-loop.txt" using 1:5 title "k=400" with lp, \
     "acc-inner-loop.txt" using 1:6 title "k=500" with lp