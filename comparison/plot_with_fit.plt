set key top left
# Funcio a ajustar
f(x) = t0 + m*x

# fit
fit f(x) 'D_vs_damp.dat' u 1:2 via t0,m

#plot colors
set style line 1 linetype 1 linecolor rgb "blue" lw 2
set style line 2 linetype 1 linecolor rgb "black" lw 1

set xlabel "damp"
set ylabel "D"

plot 'D_vs_damp.dat' u 1:2 t 'MD sims',f(x) w l ls 2 t sprintf("fit slope = %.4f",m)



