# Simple build
RM = rm
CFLAGS = -std=c99 -g -Wall -I.

ifeq ($(OS),Windows_NT)
	EXT = .exe
	LIBS = 
	RM = del
else
	EXT = .bin
	LIBS = -ledit 
endif

INC = mpc.h
OUT = nlisp$(EXT)
OBJ = nlisp.o mpc.o

.PHONY: all
all: clean run

.PHONY: clean
clean: 
	$(RM) *.o 

.PHONY: run
run:$(OUT)
	./$(OUT)

$(OUT): $(OBJ) $(INC)
	gcc -o $@ $^ $(LIBS) $(CFLAGS)  

%.o : %.c $(INC)
	gcc -c -o $@ $< $(CFLAGS) 

