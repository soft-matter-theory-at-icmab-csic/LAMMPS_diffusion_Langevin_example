# LAMMPS diffusion Langevin example
Example of simple Langevin dynamics simulation to reproduce diffusion of a system of spherical particles in implicit solvent.

The objective here is to illustrate the relation between the parameters of the simulation and the obtained diffusion coefficient *D*. The system considered is simply a dispersion of spheres interacting between them with a purely repulsive potential (a shifted, truncated Lennard Jones potential, LJ) that mimicks hard spheres. All data is reported in LJ units.

As explained in the [manual](https://docs.lammps.org/fix_nve_dotc_langevin.html) in LAMMPS, we can perform **Langevin dynamics** simulations using the  *fix langevin* command, which adds a friction $$F_f$$ force and a random $$F_r$$ force over each particle mimicking the effect of the fluid (in addition to any other forces $$F_c$$ acting to the particle due to interactions with other particles or with external fields):
```math
\begin{split}F =   & F_c + F_f + F_r \\
F_f = & - \frac{m}{\mathrm{damp}} v \\
F_r \propto & \sqrt{\frac{k_B T m}{dt~\mathrm{damp}}}\end{split}
```
The only physical quantity describing the effect of the implicit solvent is the *damp* coefficient appearing above (which has units of time) and models the friction between a particle and the implicit solvent. Usualy, in the physics literature the firction force is written in terms of a friction coefficient $$\gamma$$ as:
```math
F_f = - \gamma v
```
so $$\mathrm{damp}=m/\gamma$$. It should be noted that according to hydrodynamics, $$\gamma$$ depends on the viscosity of the fluid and the size of the particle but it is *independent* of the mass of the particle. 
The diffusion coefficient is given by the Stokes-Einstein relation:
```math
D =  \frac{k_B T}{\gamma} =  \frac{k_B T}{m}\mathrm{damp}
```
Note that in the LJ units employed in the LAMMPS simulation, we have:
```math
D =  \frac{T^* }{m^* }\mathrm{damp}
```
The diffusion coefficient is related to the mean squared displacement of the particles by the Einstein relation: 
```math
\mathrm{MSD}(t) = 6 D t
```
This relation is employed in the simulations to calculate *D* by a linear fit of the **MSD** computed along the trajectory.
The simulation result is then compared with the theoretical value, as illustrated here for a simulation with $$\mathrm{damp}=1$$ and $$T^* =1 $$ (which gives $$D^*=1$$).

<img src="https://github.com/soft-matter-theory-at-icmab-csic/LAMMPS_diffusion_Langevin_example/blob/main/fitD.png" width="400">

This repository includes the following material:
- different_damp.zip: Raw data for several examples with different values of  $$\mathrm{damp}$$ (from 0.01 to 1.5), in order to illustrate the relation between $$\mathrm{damp}$$ and $$D$$ (in all cases $$T^* =1$$).
- the initial condition (random dispersion of spheres) for all the simulaitons.
- An example of LAMMPS input file and gnuplot plot for reproducing the simulations.

A summary of the results is shown below:

<img src="https://github.com/soft-matter-theory-at-icmab-csic/LAMMPS_diffusion_Langevin_example/blob/main/comparison.png" width="500">

The simulations employed here are based on the second case of this simple [LAMMPS tutorial](https://www2.ph.ed.ac.uk/~cbrackle/lammps_tutorial.html)

