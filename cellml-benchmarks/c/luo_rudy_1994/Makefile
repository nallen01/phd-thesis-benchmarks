TARGET = luo_rudy_1994
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

.PHONY: LuoRudy1994Network/luo_rudy_1994.a
LuoRudy1994Network/luo_rudy_1994.a:
	@$(MAKE) -C LuoRudy1994Network/ luo_rudy_1994.a

$(TARGET): $(OBJECTSDIR)/runnable.o LuoRudy1994Network/luo_rudy_1994.a
	@echo Building $(TARGET)...
	@rm -f $(TARGET)
	@cd \$(OBJECTSDIR) && \$(AR) \$(AREXTRACT) ../LuoRudy1994Network/luo_rudy_1994.a
	@$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@

.PHONY: clean
clean:
	@echo Removing compiled binaries...
	@rm -rf $(TARGET) $(OBJECTSDIR)/* *~
	@$(MAKE) -C LuoRudy1994Network/ clean