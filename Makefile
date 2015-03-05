########################################################################
### RBM.f90 makefile ################################################### 
########################################################################
#
# Grid-based stream temperature model written by:
# 
# John Yearsley, Affiliate Professor
# Land Surface Hydrology Group
# University of Washington

# yearsley@hydro.washington.edu
# http://www.hydro.washington.edu/~yearsley/

# For model description see:
#
# Yearsley J. (2012): A grid-based approach for simulating stream temperature. 
# Wat. Resour. Res., 48. DOI: # # 10.1029/2011WR011515.
#
#Comment out one of the following depending on your compiler
#
# The compiler
FC = gfortran
#FC = ifort
#

FCFLAGS = -O3

HFILES =	rbm10_VIC.h

OBJECTS =	rbm10_VIC.o

exe:	$(OBJECTS)
	$(FC) $(FFLAGS) $(OBJECTS) -o ../rbm10_VIC

rbm10_VIC.o: rbm10_VIC.f90

clean:
	/bin/rm *.o

%.o: %.f90
	$(FC) $(FCFLAGS) -c  $<
