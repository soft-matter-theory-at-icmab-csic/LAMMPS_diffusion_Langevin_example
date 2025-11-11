set key top left
# Theory
f(x) = x

#plot colors
set style line 1 linetype 1 linecolor rgb "blue" lw 2
set style line 2 linetype 1 linecolor rgb "black" lw 1

#Labels
set xlabel "damp"
set ylabel "D"

#plot data
plot 'D_vs_damp.dat' u 1:2 with points pt 6 ps 2 t 'MD sims',f(x) w l ls 2 t "Theoretical value"



