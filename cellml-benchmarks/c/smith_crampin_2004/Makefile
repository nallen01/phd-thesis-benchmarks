TARGET = smith_2004
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

.PHONY: Smith2004Network/smith_2004.a
Smith2004Network/smith_2004.a:
	@$(MAKE) -C Smith2004Network/ smith_2004.a

$(TARGET): $(OBJECTSDIR)/runnable.o Smith2004Network/smith_2004.a
	@echo Building $(TARGET)...
	@rm -f $(TARGET)
	@cd \$(OBJECTSDIR) && \$(AR) \$(AREXTRACT) ../Smith2004Network/smith_2004.a
	@$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@

.PHONY: clean
clean:
	@echo Removing compiled binaries...
	@rm -rf $(TARGET) $(OBJECTSDIR)/* *~
	@$(MAKE) -C Smith2004Network/ clean