# LAMMPS diffusion Langevin example
Example of simple Langevin dynamics simulation to reproduce diffusion of a system of spherical particles in implicit solvent.

The objective here is to illustrate the relation between the parameters of the simulation (mostly the *damp* coefficient which models the friction between a particle and the implicit solvent) and the obtained diffusion coefficient *D*.

```math
\begin{split}F =   & F_c + F_f + F_r \\
F_f = & - \frac{m}{\mathrm{damp}} v \\
F_r \propto & \sqrt{\frac{k_B T m}{dt~\mathrm{damp}}}\end{split}
```

The simulations employed in the example are based on this simple [LAMMPS tutorial](https://www2.ph.ed.ac.uk/~cbrackle/lammps_tutorial.html)
