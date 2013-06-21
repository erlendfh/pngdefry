#
# This makefile builds a dynamically linked executable.

# macros --------------------------------------------------------------------

# uncomment these 2 lines only if you are using an external copy of libpng:
PNGINC = ${HOME}/include
PNGLIB = ${HOME}/lib
# uncomment these 2 lines only if you are using an external copy of zlib:
ZINC = ${HOME}/include
ZLIB = ${HOME}/lib

CC = gcc
LD = gcc
RM = rm -f
#CFLAGS = -I. -O -Wall
#CFLAGS = -I. -O3 -fomit-frame-pointer -Wall
CFLAGS = -I${ZINC} -I. -g -O3 -fomit-frame-pointer -Wall
# [note that -Wall is a gcc-specific compilation flag ("all warnings on")]
LDFLAGS =
O = .o
E =

PNGDEFRY = pngdefry

# LIBS = -lm
LIBS = -lz -lm
# LIBS = -lpng -lz -lm
#LIBS = ${ZLIB}/libz.a -lm

# uncomment these 4 lines only if you are NOT using an external copy of zlib:
# ZHDR = zlib.h
# ZOBJS  = adler32$(O) compress$(O) crc32$(O) deflate$(O) \
#  	 infback$(O) inffast$(O) inflate$(O) inftrees$(O) \
#  	 trees$(O) uncompr$(O) zutil$(O)

OBJS  = pngdefry$(O)

EXES = $(PNGDEFRY)$(E)


# implicit make rules -------------------------------------------------------

.c$(O): $(ZHDR)
	$(CC) -c $(CFLAGS) $<

# dependencies --------------------------------------------------------------

all:  $(EXES)

pngdefry$(O): pngdefry.c
	$(CC) -c $(CFLAGS) $<

$(PNGDEFRY)$(E): $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $(OBJS) $(LIBS)

# maintenance ---------------------------------------------------------------

clean:
	$(RM) $(EXES) $(OBJS)

install:
	mkdir -p $(DESTDIR)/usr/bin/
	cp $(PNGDEFRY)$(E) $(DESTDIR)/usr/bin/
	chmod 0755 $(DESTDIR)/usr/bin/$(PNGDEFRY)$(E)
