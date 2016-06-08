CC=clang
CFLAGS=-Wall
LDFLAGS=
HEADERS=$(shell ls | grep *.h)
SOURCES=$(shell ls | grep *.c)
OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=hello.out

.PHONY: all clean

default: clean all

all: $(EXECUTABLE)

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

clean:
	rm -f $(OBJECTS) $(EXECUTABLE)
