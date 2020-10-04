CC=nvcc
LIB_DIRS=/usr/lib/aarch64-linux-gnu
LIBS=hackrf 
CFLAGS=-L $(LIB_DIRS) -l$(LIBS) -O3

.PHONY : all
all : test.o

debug: test.dbg

%.dbg: %.cu
	$(CC) -o $@ $< $(CFLAGS) -g

%.o: %.cu
	$(CC) -o $@ $< $(CFLAGS)

.PHONY : run
run : test.o
	./test.o

debug_run: test.dbg
	gdb test.dbg

.PHONY : clean
clean:
	rm test.o test.dbg
