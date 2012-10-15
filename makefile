# by petter wahlman, https://twitter.com/badeip

CC      = colorgcc

SRCDIR  = ./src
OBJDIR  = ./obj
BINDIR  = ./bin

BINARY  = $(BINDIR)/weathermon

CFLAGS  = $(INCLUDE) -std=c99 -g -Wall
LDFLAGS =

VPATH   = $(SRCDIR)

BINARY_OBJ = \
	$(OBJDIR)/entropy.o \

$(OBJDIR)/%.o: %.c
	$(CC) -c $< $(CFLAGS) -o $@

.PHONY:
all:    make_dirs $(BINARY)

$(BINARY): $(BINARY_OBJ)
	$(CC) -o $@ $^ $(LDFLAGS)

.PHONY:
clean:
	@rm -rf \
		$(BINDIR) \
		$(OBJDIR) \

.PHONY:
make_dirs:
	@mkdir -p $(OBJDIR) $(BINDIR)

