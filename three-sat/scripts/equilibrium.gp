set terminal png
set xlabel "počet literálů (n)"
set ylabel "průměrná časová složitost pro 20 instancí (s)"
set style fill solid 1.00 border
set xrange [27:40]
set boxwidth 1.2
plot "Measurement/equilibriums.dat" using 1:2 title 'e=100' with lp, \
     "Measurement/equilibriums.dat" using 1:3 title "e=200" with lp, \
     "Measurement/equilibriums.dat" using 1:4 title "e=300" with lp, \
     "Measurement/equilibriums.dat" using 1:5 title "e=400" with lp, \
     "Measurement/equilibriums.dat" using 1:6 title "e=500" with lp, \