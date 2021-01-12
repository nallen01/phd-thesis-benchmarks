TARGET = tentusscher_2004_mcell
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

.PHONY: Tentusscher2004McellNetwork/tentusscher_2004_mcell.a
Tentusscher2004McellNetwork/tentusscher_2004_mcell.a:
	@$(MAKE) -C Tentusscher2004McellNetwork/ tentusscher_2004_mcell.a

$(TARGET): $(OBJECTSDIR)/runnable.o Tentusscher2004McellNetwork/tentusscher_2004_mcell.a
	@echo Building $(TARGET)...
	@rm -f $(TARGET)
	@cd \$(OBJECTSDIR) && \$(AR) \$(AREXTRACT) ../Tentusscher2004McellNetwork/tentusscher_2004_mcell.a
	@$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@

.PHONY: clean
clean:
	@echo Removing compiled binaries...
	@rm -rf $(TARGET) $(OBJECTSDIR)/* *~
	@$(MAKE) -C Tentusscher2004McellNetwork/ clean