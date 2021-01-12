TARGET = hunter_mcculloch_terkeurs_1998_version02
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

.PHONY: HunterMccullochTerkeurs1998Version02Network/hunter_mcculloch_terkeurs_1998_version02.a
HunterMccullochTerkeurs1998Version02Network/hunter_mcculloch_terkeurs_1998_version02.a:
	@$(MAKE) -C HunterMccullochTerkeurs1998Version02Network/ hunter_mcculloch_terkeurs_1998_version02.a

$(TARGET): $(OBJECTSDIR)/runnable.o HunterMccullochTerkeurs1998Version02Network/hunter_mcculloch_terkeurs_1998_version02.a
	@echo Building $(TARGET)...
	@rm -f $(TARGET)
	@cd \$(OBJECTSDIR) && \$(AR) \$(AREXTRACT) ../HunterMccullochTerkeurs1998Version02Network/hunter_mcculloch_terkeurs_1998_version02.a
	@$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@

.PHONY: clean
clean:
	@echo Removing compiled binaries...
	@rm -rf $(TARGET) $(OBJECTSDIR)/* *~
	@$(MAKE) -C HunterMccullochTerkeurs1998Version02Network/ clean