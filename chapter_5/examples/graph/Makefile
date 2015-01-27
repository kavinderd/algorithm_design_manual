WARNINGS:= -Wall
CFLAGS:= $(WARNINGS) -g

all: graph

graph: queue.o

queue: 
	queue.c bool.h item.h
	
clean:
	rm -f graph
	rm -f queue.o
