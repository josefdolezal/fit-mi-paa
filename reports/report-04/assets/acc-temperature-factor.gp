set terminal png
set key left top
set xlabel "počet předmětů (n)"
set ylabel "relativní odchylka (%)"
set style fill solid 1.00 border
set xrange [0:45]
set boxwidth 1.2
plot "acc-temperature-factor.txt" using 1:2 title 'k=0.8' with lp, \
     "acc-temperature-factor.txt" using 1:3 title "k=0.85" with lp, \
     "acc-temperature-factor.txt" using 1:4 title "k=0.9" with lp, \
     "acc-temperature-factor.txt" using 1:5 title "k=0.95" with lp, \
     "acc-temperature-factor.txt" using 1:6 title "k=0.99" with lp