set terminal png
set xlabel "počet předmětů (n)"
set ylabel "čas (s)"
set style fill solid 1.00 border
set xrange [0:30]
set logscale y
set boxwidth 1.2
plot "all-cases-duration.txt" using 1:2 with boxes title "Průměrný čas pro n předmětů"