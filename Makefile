## ***************************************************************************
##
##  Makefile --
##
##  Original Author: Da Ke 
##
## ***************************************************************************
##
##  MODIFICATION LOG - modifiers, enter your name, affiliation, date and
##  changes you are making here.
##
##      Name, Affiliation, Date:
##	Da Ke,	North Caolina State University, Nov. 22 2014
##  Description of Modification:
## 	Include SystemC installation path 
## ***************************************************************************

include ./Makefile.defs



#-------------------------------------------------------------------------------------------
PRJ = sim_cache

# List Source files
SRC = stimulus.cc cachesim_top.cc

# List all your object .o here 
OBJ = stimulus.o cachesim_top.o

# List corresponding compiled object files here (.o files)
HEADERS = stimulus.h cachesim_top.h

# dependency:
#DEPENDENCIES = $(OBJ) $(SRC) $(HEADERS) 
################################

#default rule

all: $(PRJ)
	@echo " "
	@echo "input './simcache xxx'"
	@echo " " 
	
$(PRJ): $(OBJ)
	$(CC) -o $(PRJ) $(CFLAGS) $(OBJ)   
	@echo "-----------DONE WITH SIM_CACHE BUILD -----------"

.cc.o: 
	$(CC) $(CFLAGS) -c $*.cc
	
#type "make clean" to remove all .o files plus the sim_cache binary
clean:
	rm -f *.o sim_cache

#type "make clobber" to remove all .o files (leaves sim_cache binary)
clobber:
	rm -f *.o


