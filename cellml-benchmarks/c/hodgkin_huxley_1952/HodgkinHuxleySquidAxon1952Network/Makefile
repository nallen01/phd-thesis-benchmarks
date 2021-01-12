TARGET = hodgkin_huxley_squid_axon_1952.a
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

$(OBJECTSDIR)/environment.o: Environment/environment.c Environment/environment.h $(BASEDIR)/config.h
	@echo Building environment...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/hodgkin_huxley_squid_axon_1952.o: hodgkin_huxley_squid_axon_1952.c hodgkin_huxley_squid_axon_1952.h $(BASEDIR)/config.h
	@echo Building hodgkin_huxley_squid_axon_1952...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/leakage_current.o: LeakageCurrent/leakage_current.c LeakageCurrent/leakage_current.h $(BASEDIR)/config.h
	@echo Building leakage_current...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/membrane.o: Membrane/membrane.c Membrane/membrane.h $(BASEDIR)/config.h
	@echo Building membrane...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/potassium_channel.o: PotassiumChannel/potassium_channel.c PotassiumChannel/potassium_channel.h $(BASEDIR)/config.h
	@echo Building potassium_channel...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/potassium_channel_n_gate.o: PotassiumChannelNGate/potassium_channel_n_gate.c PotassiumChannelNGate/potassium_channel_n_gate.h $(BASEDIR)/config.h
	@echo Building potassium_channel_n_gate...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/sodium_channel.o: SodiumChannel/sodium_channel.c SodiumChannel/sodium_channel.h $(BASEDIR)/config.h
	@echo Building sodium_channel...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/sodium_channel_h_gate.o: SodiumChannelHGate/sodium_channel_h_gate.c SodiumChannelHGate/sodium_channel_h_gate.h $(BASEDIR)/config.h
	@echo Building sodium_channel_h_gate...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/sodium_channel_m_gate.o: SodiumChannelMGate/sodium_channel_m_gate.c SodiumChannelMGate/sodium_channel_m_gate.h $(BASEDIR)/config.h
	@echo Building sodium_channel_m_gate...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(TARGET): $(OBJECTSDIR)/environment.o $(OBJECTSDIR)/hodgkin_huxley_squid_axon_1952.o $(OBJECTSDIR)/leakage_current.o $(OBJECTSDIR)/membrane.o $(OBJECTSDIR)/potassium_channel.o $(OBJECTSDIR)/potassium_channel_n_gate.o $(OBJECTSDIR)/sodium_channel.o $(OBJECTSDIR)/sodium_channel_h_gate.o $(OBJECTSDIR)/sodium_channel_m_gate.o
	@echo Building $(TARGET)...
	@rm -f $(TARGET)
	@$(AR) $(ARFLAGS) $(TARGET) $(OBJECTSDIR)/*.o

.PHONY: clean
clean:
	@echo Removing compiled binaries...
	@rm -rf $(TARGET) $(OBJECTSDIR)/* *~