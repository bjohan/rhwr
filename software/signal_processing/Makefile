GPUCC=nvcc
LIB_DIRS=/usr/lib/aarch64-linux-gnu
LIBS=hackrf 
LDFLAGS=-L $(LIB_DIRS) -l$(LIBS)
CFLAGS= -O3
CXX=g++
CXXSRC=$(wildcard *.cpp)
CUSRC=$(wildcard *.cu)
CXXOBJS=$(patsubst %.cpp, %.o, $(CXXSRC))  
CUOBJS=$(patsubst %.cu, %.o, $(CUSRC))
OBJS=$(CXXOBJS) $(CUOBJS)

.PHONY : all
all : sigproc

%.o: %.cu
	$(GPUCC) -c -o $@ $< $(CFLAGS)

%.o: %.cpp
	$(CXX) -c -o $@ $< $(CXXFLAGX)

sigproc: $(OBJS)
	echo $(OBJS)
	$(GPUCC) -o sigproc $(OBJS) $(LDFLAGS)

.PHONY : run
run : sigproc
	./sigproc

.PHONY : clean
clean:
	rm *.o sigproc
