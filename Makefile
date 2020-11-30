.POSIX:
all:
	$(CC) -o among-sus $(CFLAGS) \
		$$(git rev-parse --short HEAD &>/dev/null && \
		printf -- '-DVERSION="%s"' "$$(git rev-parse --short HEAD)" || \
		printf -- '-DVERSION="unknown"') main.c $(LDFLAGS)

clean:
	rm -f among-sus
