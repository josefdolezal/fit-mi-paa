set terminal png
set key left top
set xlabel "počet předmětů (n)"
set ylabel "čas (s)"
set style fill solid 1.00 border
set xrange [0:35]
set logscale y
set boxwidth 1.2
plot "multiplot.txt" using 1:2 title 'B\&B' with lp, \
     "multiplot.txt" using 1:3 title "Dynamické programování" with lp, \
     "multiplot.txt" using 1:4 title "FPTAS" with lp