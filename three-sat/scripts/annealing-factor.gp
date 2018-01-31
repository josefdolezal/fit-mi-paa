set terminal png
set xlabel "počet literálů (n)"
set ylabel "průměrná časová složitost pro 20 instancí (s)"
set style fill solid 1.00 border
set xrange [27:40]
set boxwidth 1.2
plot "Measurement/factors.dat" using 1:2 title 'f=0.8' with lp, \
     "Measurement/factors.dat" using 1:3 title "f=0.85" with lp, \
     "Measurement/factors.dat" using 1:4 title "f=0.9" with lp, \
     "Measurement/factors.dat" using 1:5 title "f=0.95" with lp, \
     "Measurement/factors.dat" using 1:6 title "f=0.99" with lp, \