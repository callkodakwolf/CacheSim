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

CC = gcc
#OPT = -O3
WARN = -Wall -g -pedantic -Wno-long-long -Werror

## Variable that points to SystemC installation path
SYSTEMC_HOME =/usr/local/systemc-2.3.1

## Select the target Architecture
TARGET_ARCH = linux64

## Select the architecture suffix, if necessary
ARCH_SUFFIX = -$(TARGET_ARCH)

# Explicit location of the SystemC headers
SYSTEMC_INC_DIR =-I. -I$(SYSTEMC_HOME)/include

# Explicit location if the SystenC library
SYSTEMC_LIB_DIR = $(SYSTEMC_HOME)/lib$(ARCH_SUFFIX)

LIBS = -L $(SYSTEMC_LIB_DIR)  -lsystemc -lstdc++ -lm

CFLAGS = $(SYSTEMC_INC_DIR) $(LIBS)

# Header files used, for dependancy checking
HEADERS = stimulus.h 

# List all your .cc files here (source files, excluding header files)
SIM_SRC = stimulus.cc cachesim_top.cc

# List corresponding compiled object files here (.o files)
SIM_OBJ = stimulus.o cachesim_top.o

# dependency:
DEPENDENCIES = $(HEADERS) $(SIM_SRC)  
################################

#default rule

all: sim_cache
	@echo "my work is done here..." 
	
# rule for making sim_cache

sim_cache: $(DEPENDENCIES)
	@echo $(CC)
	$(CC) $(WARN) $(SIM_SRC) $(CFLAGS) -o sim_cache 
	@echo "-----------DONE WITH SIM_CACHE-----------"
	
#type "make clean" to remove all .o files plus the sim_cache binary
clean:
	rm -f *.o sim_cache

#type "make clobber" to remove all .o files (leaves sim_cache binary)
clobber:
	rm -f *.o


