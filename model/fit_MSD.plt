set key top left
# Function for fitting MSD in 3D diffusion (x is time and f(x) is MSD)
f(x) = t0 + 6*D*x
#time step to convert number of steps into time
dt=0.01

# fit
fit f(x) 'msd.dat' u ($1*dt):2 via t0,D

#plot colors
set style line 1 linetype 1 linecolor rgb "blue" lw 2
set style line 2 linetype 1 linecolor rgb "black" lw 1

set xlabel "Time (LJ units)"
set ylabel "MSD (LJ units)"

plot 'msd.dat' u ($1*dt):2 t 'MD sims',f(x) w l ls 2 t sprintf("fit D= %.4f",D)



