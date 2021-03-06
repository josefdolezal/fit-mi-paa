set terminal png
set key left top
set xlabel "počet předmětů (n)"
set ylabel "čas (s)"
set style fill solid 1.00 border
set xrange [0:45]
set boxwidth 1.2
plot "dur-initial-temperature.txt" using 1:2 title 't=200' with lp, \
     "dur-initial-temperature.txt" using 1:3 title "t=240" with lp, \
     "dur-initial-temperature.txt" using 1:4 title "t=280" with lp, \
     "dur-initial-temperature.txt" using 1:5 title "t=320" with lp, \
     "dur-initial-temperature.txt" using 1:6 title "t=360" with lp, \
     "dur-initial-temperature.txt" using 1:7 title "t=400" with lp, \