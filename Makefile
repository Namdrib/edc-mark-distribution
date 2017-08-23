# Makefile for edc-mark-distribution

CFLAGS = -std=gnu++11 -O2 -Wall

all: textToCSV.cpp
	g++ -o a textToCSV.cpp $(CFLAGS)
	
clean:
	rm -f *.exe *.o *.out