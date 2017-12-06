set terminal png
set xlabel "poměr kapacity k sumární váze"
set ylabel "čas (s)"
plot "data.txt" using 1:2 with lines title "Průměrný čas pro 27 předmětů"