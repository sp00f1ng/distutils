DESTDIR =
BINDIR = /usr/bin
USRDIR = /usr

VERSION = 1.0
NAME = distutils

all: distmk distgen

distmk: distmk.in

distgen: distgen.in

.PHONY:	install clean

install: all
	install -D -m 0755 distmk.in $(DESTDIR)$(BINDIR)/distmk
	install -D -m 0755 distgen.in $(DESTDIR)$(BINDIR)/distgen
	for sys in systems/*/*/*; \
		do install -D -m 0644 $$sys $(DESTDIR)$(USRDIR)/$$sys; \
	done

clean:
	rm -f distmk distgen
