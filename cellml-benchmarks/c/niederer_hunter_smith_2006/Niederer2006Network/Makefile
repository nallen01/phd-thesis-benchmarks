TARGET = niederer_2006.a
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

$(OBJECTSDIR)/cross_bridges.o: CrossBridges/cross_bridges.c CrossBridges/cross_bridges.h $(BASEDIR)/config.h
	@echo Building Cross_Bridges...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/myofilaments.o: Myofilaments/myofilaments.c Myofilaments/myofilaments.h $(BASEDIR)/config.h
	@echo Building Myofilaments...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/environment.o: Environment/environment.c Environment/environment.h $(BASEDIR)/config.h
	@echo Building environment...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/filament_overlap.o: FilamentOverlap/filament_overlap.c FilamentOverlap/filament_overlap.h $(BASEDIR)/config.h
	@echo Building filament_overlap...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/intracellular_ion_concentrations.o: IntracellularIonConcentrations/intracellular_ion_concentrations.c IntracellularIonConcentrations/intracellular_ion_concentrations.h $(BASEDIR)/config.h
	@echo Building intracellular_ion_concentrations...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/isometric_tension.o: IsometricTension/isometric_tension.c IsometricTension/isometric_tension.h $(BASEDIR)/config.h
	@echo Building isometric_tension...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/length_independent_tension.o: LengthIndependentTension/length_independent_tension.c LengthIndependentTension/length_independent_tension.h $(BASEDIR)/config.h
	@echo Building length_independent_tension...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/niederer_2006.o: niederer_2006.c niederer_2006.h $(BASEDIR)/config.h
	@echo Building niederer_2006...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/thinfilaments.o: Thinfilaments/thinfilaments.c Thinfilaments/thinfilaments.h $(BASEDIR)/config.h
	@echo Building thinfilaments...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/tropomyosin.o: Tropomyosin/tropomyosin.c Tropomyosin/tropomyosin.h $(BASEDIR)/config.h
	@echo Building tropomyosin...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/troponin.o: Troponin/troponin.c Troponin/troponin.h $(BASEDIR)/config.h
	@echo Building troponin...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(TARGET): $(OBJECTSDIR)/cross_bridges.o $(OBJECTSDIR)/myofilaments.o $(OBJECTSDIR)/environment.o $(OBJECTSDIR)/filament_overlap.o $(OBJECTSDIR)/intracellular_ion_concentrations.o $(OBJECTSDIR)/isometric_tension.o $(OBJECTSDIR)/length_independent_tension.o $(OBJECTSDIR)/niederer_2006.o $(OBJECTSDIR)/thinfilaments.o $(OBJECTSDIR)/tropomyosin.o $(OBJECTSDIR)/troponin.o
	@echo Building $(TARGET)...
	@rm -f $(TARGET)
	@$(AR) $(ARFLAGS) $(TARGET) $(OBJECTSDIR)/*.o

.PHONY: clean
clean:
	@echo Removing compiled binaries...
	@rm -rf $(TARGET) $(OBJECTSDIR)/* *~