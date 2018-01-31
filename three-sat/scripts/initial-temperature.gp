set terminal png
set xlabel "počet literálů (n)"
set ylabel "průměrná časová složitost pro 20 instancí (s)"
set style fill solid 1.00 border
set xrange [27:40]
set boxwidth 1.2
plot "Measurement/initial-temperatures.dat" using 1:2 title 't=225' with lp, \
     "Measurement/initial-temperatures.dat" using 1:3 title "t=250" with lp, \
     "Measurement/initial-temperatures.dat" using 1:4 title "t=275" with lp, \
     "Measurement/initial-temperatures.dat" using 1:5 title "t=300" with lp, \
     "Measurement/initial-temperatures.dat" using 1:6 title "t=325" with lp, \
     "Measurement/initial-temperatures.dat" using 1:7 title "t=350" with lp, \