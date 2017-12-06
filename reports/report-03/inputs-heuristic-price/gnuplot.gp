set terminal png
set xlabel "maximální cena předmětu"
set ylabel "relativní odchylka"
plot "data.txt" using 1:2 with lines title "Průměrná relativní odchylka pro 25 předmětů"