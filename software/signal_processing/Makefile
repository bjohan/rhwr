GPUCC=nvcc
LIB_DIRS=/usr/lib/aarch64-linux-gnu
PYTHON_BIN     ?= python3
PYTHON_CONFIG  := $(PYTHON_BIN)-config
PYTHON_INCLUDE ?= $(shell $(PYTHON_CONFIG) --includes)
EXTRA_FLAGS    := $(PYTHON_INCLUDE)
INCLUDE_DIRS=../../external_dependencies/matplotlib-cpp/ $(PYTHON_INCLUDE)

LIBS=hackrf 
INCLUDEFLAGS=-I $(INCLUDE_DIRS)
LDFLAGS=-L $(LIB_DIRS) -l$(LIBS) -lpython3.6m
CUFLAGS= -O3 $(INCLUDEFLAGS) -g
CXXFLAGS=$(CUFLAGS)
CXX=g++
CXX=nvcc
CXXSRC=$(wildcard *.cpp)
CUSRC=$(wildcard *.cu)
CXXOBJS=$(patsubst %.cpp, %.o, $(CXXSRC))  
CUOBJS=$(patsubst %.cu, %.o, $(CUSRC))
OBJS=$(CUOBJS) $(CXXOBJS)

.PHONY : all
all : sigproc

%.o: %.cu
	$(GPUCC) -c -o $@ $< $(CUFLAGS)

%.o: %.cpp
	$(CXX) -c -o $@ $< $(CXXFLAGS)

sigproc: $(OBJS)
	echo $(OBJS)
	$(GPUCC) -o sigproc $(OBJS) $(LDFLAGS)

.PHONY : run
run : sigproc
	./sigproc

.PHONY : clean
clean:
	rm $(OBJS) sigproc
