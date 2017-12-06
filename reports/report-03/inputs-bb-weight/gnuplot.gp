set terminal png
set xlabel "maximální váha předmětu"
set ylabel "čas (s)"
plot "data.txt" using 1:2 with lines title "Průměrný čas pro 23 předmětů"