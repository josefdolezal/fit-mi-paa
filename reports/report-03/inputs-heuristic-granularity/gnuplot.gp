set terminal png
set xlabel "exponent k (granularita)"
set ylabel "relativní odchylka"
plot "data.txt" using 1:2 with lines title "Průměrná relativní odchylka pro 20 předmětů"