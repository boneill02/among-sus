.POSIX:

PREFIX = /usr/local
MANPREFIX = $(PREFIX)/man/man6
MANFILES = among-sus.6
TARG = among-sus

all:
	$(CC) -o among-sus $(CFLAGS) \
		$$(git rev-parse --short HEAD >/dev/null 2>/dev/null && \
		printf -- '-DVERSION="%s"' "$$(git rev-parse --short HEAD)") \
		main.c $(LDFLAGS)

clean:
	rm -f among-sus

install:
	cp -fv among-sus.6 $(MANPREFIX)
	cp -fv $(TARG) $(PREFIX)/bin

uninstall:
	rm -fv $(MANPREFIX)$(MANFILES) $(PREFIX)/bin/$(TARG)
