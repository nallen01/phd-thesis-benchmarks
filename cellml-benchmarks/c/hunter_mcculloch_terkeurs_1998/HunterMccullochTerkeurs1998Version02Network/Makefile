TARGET = hunter_mcculloch_terkeurs_1998_version02.a
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

$(OBJECTSDIR)/tnc_ca_binding_kinetics.o: TncCaBindingKinetics/tnc_ca_binding_kinetics.c TncCaBindingKinetics/tnc_ca_binding_kinetics.h $(BASEDIR)/config.h
	@echo Building TnC_Ca_binding_kinetics...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/calcium_transient.o: CalciumTransient/calcium_transient.c CalciumTransient/calcium_transient.h $(BASEDIR)/config.h
	@echo Building calcium_transient...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/crossbridge_kinetics.o: CrossbridgeKinetics/crossbridge_kinetics.c CrossbridgeKinetics/crossbridge_kinetics.h $(BASEDIR)/config.h
	@echo Building crossbridge_kinetics...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/environment.o: Environment/environment.c Environment/environment.h $(BASEDIR)/config.h
	@echo Building environment...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/hunter_mcculloch_terkeurs_1998_version02.o: hunter_mcculloch_terkeurs_1998_version02.c hunter_mcculloch_terkeurs_1998_version02.h $(BASEDIR)/config.h
	@echo Building hunter_mcculloch_terkeurs_1998_version02...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/thin_filament_kinetics.o: ThinFilamentKinetics/thin_filament_kinetics.c ThinFilamentKinetics/thin_filament_kinetics.h $(BASEDIR)/config.h
	@echo Building thin_filament_kinetics...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(TARGET): $(OBJECTSDIR)/tnc_ca_binding_kinetics.o $(OBJECTSDIR)/calcium_transient.o $(OBJECTSDIR)/crossbridge_kinetics.o $(OBJECTSDIR)/environment.o $(OBJECTSDIR)/hunter_mcculloch_terkeurs_1998_version02.o $(OBJECTSDIR)/thin_filament_kinetics.o
	@echo Building $(TARGET)...
	@rm -f $(TARGET)
	@$(AR) $(ARFLAGS) $(TARGET) $(OBJECTSDIR)/*.o

.PHONY: clean
clean:
	@echo Removing compiled binaries...
	@rm -rf $(TARGET) $(OBJECTSDIR)/* *~