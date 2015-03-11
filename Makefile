#
# Makefile for the grid-based semi-Lagrangian water temperature model, RBM10_VIC
#
# Start of the makefile
#
# Defining variables
#
objects = rbm10_VIC.o Begin.o Systmm.o Particle_Track.o \
          Energy.o Julian.o tntrp.o Read_Forcing.o \
          Block_Energy.o Block_Hydro.o Block_Network.o Block_WQ.o
f90comp = gfortran
# Makefile
rbm10_VIC: $(objects)
	$(f90comp) -o rbm10_VIC $(objects)
bgin.mod: Begin.o Begin.f90
	$(f90comp) -c Begin.f90
Begin.o: block_network.mod j_function.mod Begin.f90
	$(f90comp) -c Begin.f90
Read_Forcing.o: block_energy.mod block_hydro.mod block_network.mod Read_Forcing.f90
	$(f90comp) -c Read_Forcing.f90 
systm.mod: Systmm.o Systmm.f90
	$(f90comp) -c Systmm.f90
Systmm.o: block_network.mod enrgy.mod p_track.mod Systmm.f90
	$(f90comp) -c Systmm.f90
enrgy.mod: Energy.o Energy.f90
	$(f90comp) -c Energy.f90
Energy.o: block_energy.mod Energy.f90
	$(f90comp) -c Energy.f90
p_track.mod: Particle_Track.o Particle_Track.f90
	$(f90comp) -c Particle_Track.f90
Particle_Track.o: block_hydro.mod block_network.mod Particle_Track.f90
	$(f90comp) -c Particle_Track.f90
j_function.mod: Julian.o Julian.f90
	$(f90comp) -c Julian.f90
j_function.o: Julian.f90
	$(f90comp) -c Julian.f90
tntrp.o: tntrp.f90
	$(f90comp) -c tntrp.f90
block_wq.mod: Block_WQ.o Block_WQ.f90
	$(f90comp) -c Block_WQ.f90
block_energy.mod: Block_Energy.f90
	$(f90comp) -c Block_Energy.f90
block_hydro.mod: Block_Hydro.o Block_Hydro.f90
	$(f90comp) -c Block_Hydro.f90
block_network.mod: Block_Network.o Block_Network.f90
	$(f90comp) -c Block_Network.f90
rbm10_VIC.o: bgin.mod systm.mod rbm10_VIC.f90
	$(f90comp) -c rbm10_VIC.f90

# Cleaning everything
clean:
	rm bgin.mod block_hydro.mod block_network.mod enrgy.mod j_function.mod\
           p_track.mod systm.mod rbm10_VIC
	rm $(objects)
