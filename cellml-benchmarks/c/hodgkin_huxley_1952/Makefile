TARGET = hodgkin_huxley_squid_axon_1952
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

.PHONY: HodgkinHuxleySquidAxon1952Network/hodgkin_huxley_squid_axon_1952.a
HodgkinHuxleySquidAxon1952Network/hodgkin_huxley_squid_axon_1952.a:
	@$(MAKE) -C HodgkinHuxleySquidAxon1952Network/ hodgkin_huxley_squid_axon_1952.a

$(TARGET): $(OBJECTSDIR)/runnable.o HodgkinHuxleySquidAxon1952Network/hodgkin_huxley_squid_axon_1952.a
	@echo Building $(TARGET)...
	@rm -f $(TARGET)
	@cd \$(OBJECTSDIR) && \$(AR) \$(AREXTRACT) ../HodgkinHuxleySquidAxon1952Network/hodgkin_huxley_squid_axon_1952.a
	@$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@

.PHONY: clean
clean:
	@echo Removing compiled binaries...
	@rm -rf $(TARGET) $(OBJECTSDIR)/* *~
	@$(MAKE) -C HodgkinHuxleySquidAxon1952Network/ clean