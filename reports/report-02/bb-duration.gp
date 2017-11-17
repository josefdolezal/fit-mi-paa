set terminal png
set xlabel "počet předmětů (n)"
set ylabel "čas (s)"
set style fill solid 1.00 border
set xrange [0:35]
set logscale y
set boxwidth 1.2
plot "bb-duration.txt" using 1:2 with boxes title "Průměrný čas pro n předmětů"