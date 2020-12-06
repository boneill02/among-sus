.POSIX:

CFLAGS = $$(git rev-parse HEAD &>/dev/null && echo -DVERSION="\"$$(git rev-parse --short HEAD)\"")

all: among-sus

among-sus: main.o
	$(CC) $(LDFLAGS) -o $@ main.o

clean:
	rm -f among-sus main.o
