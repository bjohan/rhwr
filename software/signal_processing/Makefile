GPUCC=nvcc
LIB_DIRS=/usr/lib/aarch64-linux-gnu
#PYTHON_BIN     ?= python3
#PYTHON_CONFIG  := $(PYTHON_BIN)-config
#PYTHON_INCLUDE ?= $(shell $(PYTHON_CONFIG) --includes)
INCLUDE_DIRS=

LIBS=hackrf,readline,glut,GL 
INCLUDEFLAGS=-I $(INCLUDE_DIRS)
LDFLAGS=-L $(LIB_DIRS) -l$(LIBS)
CUFLAGS= -O0 $(INCLUDEFLAGS) -ggdb -std=c++11 
CXXFLAGS=$(CUFLAGS)
CXX=g++
#CXX=nvcc
APPSRCS=$(wildcard application_*.c*)
CXXSRC=$(filter-out $(APPSRCS), $(wildcard *.cpp))
CUSRC=$(filter-out $(APPSRCS), $(wildcard *.cu))
CXXOBJS=$(patsubst %.cpp, %.o, $(CXXSRC))  
CUOBJS=$(patsubst %.cu, %.o, $(CUSRC))
OBJS=$(CUOBJS) $(CXXOBJS)
APPOBJS=$(pathsubst, %.cu, %.o, $(APPSRCS))
APPS=$(pathsubst, %.cu,, $(APPSRCS))

.PHONY : all
all : sigproc sigview

%.o: %.cu
	$(GPUCC) -c -o $@ $< $(CUFLAGS)

%.o: %.cpp
	$(CXX) -c -o $@ $< $(CXXFLAGS)



sigproc: $(OBJS) application_sigproc.o
	$(GPUCC) -o sigproc $^ $(LDFLAGS)

sigview: $(OBJS) application_sigview.o
	$(GPUCC) -o sigview $^ $(LDFLAGS)

.PHONY : run
run : sigproc
	./sigproc

.PHONY : clean
clean:
	rm $(OBJS) $(APPOBJS) application_sigproc.o application_sigview.o sigproc sigview
