# Simple build
all: run

run:prompt.exe
	./prompt.exe

%.exe:%.c
	gcc -o $@ $< -g 


