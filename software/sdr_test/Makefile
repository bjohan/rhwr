GPUCC=nvcc
LIB_DIRS=/usr/lib/aarch64-linux-gnu
#PYTHON_BIN     ?= python3
#PYTHON_CONFIG  := $(PYTHON_BIN)-config
#PYTHON_INCLUDE ?= $(shell $(PYTHON_CONFIG) --includes)
INCLUDE_DIRS=

LIBS=hackrf,readline,glut,GL,GLEW,GLU 
INCLUDEFLAGS=-I $(INCLUDE_DIRS)
LDFLAGS=-L $(LIB_DIRS) -l$(LIBS)
CUFLAGS= -O3 $(INCLUDEFLAGS) -ggdb -std=c++11 
CXXFLAGS=$(CUFLAGS)
CXX=g++
#CXX=nvcc
APPSRCS = $(wildcard application_*.c*)
CXXSRC = $(filter-out $(APPSRCS), $(wildcard *.cpp)) $(wildcard gui/*.cpp) $(wildcard gui/imgui/*.cpp)
CUSRC = $(filter-out $(APPSRCS), $(wildcard *.cu))
CXXOBJS = $(patsubst %.cpp, %.o, $(CXXSRC))  
CUOBJS = $(patsubst %.cu, %.o, $(CUSRC))
OBJS = $(CUOBJS) $(CXXOBJS)
APPOBJS = $(pathsubst, %.cu, %.o, $(APPSRCS))
APPS = $(pathsubst, %.cu,, $(APPSRCS))

.PHONY : all
all : sdr_test

%.o: %.cu
	$(GPUCC) -c -o $@ $< $(CUFLAGS)

%.o: %.cpp
	$(CXX) -c -o $@ $< $(CXXFLAGS)



sdr_test: $(OBJS) application_sdr_test.o
	$(GPUCC) -o $@ $^ $(LDFLAGS)

.PHONY : run
run : sdr_test
	./sdr_test

.PHONY : clean
clean:
	rm -f $(OBJS) $(APPOBJS) application_sdr_test.o sdr_test 
