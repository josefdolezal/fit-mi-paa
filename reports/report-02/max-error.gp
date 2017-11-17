set terminal png
set xlabel "počet předmětů (n)"
set ylabel "maximální relativní odchylka (%)"
set style fill solid 1.00 border
set xrange [0:30]
set style fill solid border -1
set boxwidth 0.9
plot "max-error.txt" using 1:2 title 'e = 0.1' with boxes, \
     "max-error.txt" using 1:3 title 'e = 0.3' with boxes, \
     "max-error.txt" using 1:4 title 'e = 0.9' with boxes