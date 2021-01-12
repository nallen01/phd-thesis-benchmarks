TARGET = uoa_myocite
CC ?= gcc
BASEDIR ?= $(shell (pwd | sed 's/ /\\ /g'))
CFLAGS ?= -c -O2 -Wall -I$(BASEDIR)
LDFLAGS ?= -g -Wall
LDLIBS ?= -lm
AR ?= ar
ARFLAGS ?= cr
AREXTRACT ?= x
OBJECTSDIR ?= Objects

export

build: $(TARGET)

$(OBJECTSDIR)/runnable.o: runnable.c $(BASEDIR)/config.h
	@echo Building runnable...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

.PHONY: UoaMyociteNetwork/uoa_myocite.a
UoaMyociteNetwork/uoa_myocite.a:
	@$(MAKE) -C UoaMyociteNetwork/ uoa_myocite.a

$(TARGET): $(OBJECTSDIR)/runnable.o UoaMyociteNetwork/uoa_myocite.a
	@echo Building $(TARGET)...
	@rm -f $(TARGET)
	@cd \$(OBJECTSDIR) && \$(AR) \$(AREXTRACT) ../UoaMyociteNetwork/uoa_myocite.a
	@$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@

.PHONY: clean
clean:
	@echo Removing compiled binaries...
	@rm -rf $(TARGET) $(OBJECTSDIR)/* *~
	@$(MAKE) -C UoaMyociteNetwork/ clean