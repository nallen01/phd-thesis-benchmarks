TARGET = luo_rudy_1994.a
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

$(OBJECTSDIR)/l_type_ca_channel.o: LTypeCaChannel/l_type_ca_channel.c LTypeCaChannel/l_type_ca_channel.h $(BASEDIR)/config.h
	@echo Building L_type_Ca_channel...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/l_type_ca_channel_d_gate.o: LTypeCaChannelDGate/l_type_ca_channel_d_gate.c LTypeCaChannelDGate/l_type_ca_channel_d_gate.h $(BASEDIR)/config.h
	@echo Building L_type_Ca_channel_d_gate...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/l_type_ca_channel_f_ca_gate.o: LTypeCaChannelFCaGate/l_type_ca_channel_f_ca_gate.c LTypeCaChannelFCaGate/l_type_ca_channel_f_ca_gate.h $(BASEDIR)/config.h
	@echo Building L_type_Ca_channel_f_Ca_gate...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/l_type_ca_channel_f_gate.o: LTypeCaChannelFGate/l_type_ca_channel_f_gate.c LTypeCaChannelFGate/l_type_ca_channel_f_gate.h $(BASEDIR)/config.h
	@echo Building L_type_Ca_channel_f_gate...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/na_ca_exchanger.o: NaCaExchanger/na_ca_exchanger.c NaCaExchanger/na_ca_exchanger.h $(BASEDIR)/config.h
	@echo Building Na_Ca_exchanger...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/calcium_background_current.o: CalciumBackgroundCurrent/calcium_background_current.c CalciumBackgroundCurrent/calcium_background_current.h $(BASEDIR)/config.h
	@echo Building calcium_background_current...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/calcium_fluxes_in_the_sr.o: CalciumFluxesInTheSr/calcium_fluxes_in_the_sr.c CalciumFluxesInTheSr/calcium_fluxes_in_the_sr.h $(BASEDIR)/config.h
	@echo Building calcium_fluxes_in_the_SR...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/environment.o: Environment/environment.c Environment/environment.h $(BASEDIR)/config.h
	@echo Building environment...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/fast_sodium_current.o: FastSodiumCurrent/fast_sodium_current.c FastSodiumCurrent/fast_sodium_current.h $(BASEDIR)/config.h
	@echo Building fast_sodium_current...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/fast_sodium_current_h_gate.o: FastSodiumCurrentHGate/fast_sodium_current_h_gate.c FastSodiumCurrentHGate/fast_sodium_current_h_gate.h $(BASEDIR)/config.h
	@echo Building fast_sodium_current_h_gate...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/fast_sodium_current_j_gate.o: FastSodiumCurrentJGate/fast_sodium_current_j_gate.c FastSodiumCurrentJGate/fast_sodium_current_j_gate.h $(BASEDIR)/config.h
	@echo Building fast_sodium_current_j_gate...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/fast_sodium_current_m_gate.o: FastSodiumCurrentMGate/fast_sodium_current_m_gate.c FastSodiumCurrentMGate/fast_sodium_current_m_gate.h $(BASEDIR)/config.h
	@echo Building fast_sodium_current_m_gate...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/ionic_concentrations.o: IonicConcentrations/ionic_concentrations.c IonicConcentrations/ionic_concentrations.h $(BASEDIR)/config.h
	@echo Building ionic_concentrations...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/luo_rudy_1994.o: luo_rudy_1994.c luo_rudy_1994.h $(BASEDIR)/config.h
	@echo Building luo_rudy_1994...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/membrane.o: Membrane/membrane.c Membrane/membrane.h $(BASEDIR)/config.h
	@echo Building membrane...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/non_specific_calcium_activated_current.o: NonSpecificCalciumActivatedCurrent/non_specific_calcium_activated_current.c NonSpecificCalciumActivatedCurrent/non_specific_calcium_activated_current.h $(BASEDIR)/config.h
	@echo Building non_specific_calcium_activated_current...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/plateau_potassium_current.o: PlateauPotassiumCurrent/plateau_potassium_current.c PlateauPotassiumCurrent/plateau_potassium_current.h $(BASEDIR)/config.h
	@echo Building plateau_potassium_current...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/sarcolemmal_calcium_pump.o: SarcolemmalCalciumPump/sarcolemmal_calcium_pump.c SarcolemmalCalciumPump/sarcolemmal_calcium_pump.h $(BASEDIR)/config.h
	@echo Building sarcolemmal_calcium_pump...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/sodium_background_current.o: SodiumBackgroundCurrent/sodium_background_current.c SodiumBackgroundCurrent/sodium_background_current.h $(BASEDIR)/config.h
	@echo Building sodium_background_current...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/sodium_potassium_pump.o: SodiumPotassiumPump/sodium_potassium_pump.c SodiumPotassiumPump/sodium_potassium_pump.h $(BASEDIR)/config.h
	@echo Building sodium_potassium_pump...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/time_dependent_potassium_current.o: TimeDependentPotassiumCurrent/time_dependent_potassium_current.c TimeDependentPotassiumCurrent/time_dependent_potassium_current.h $(BASEDIR)/config.h
	@echo Building time_dependent_potassium_current...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/time_dependent_potassium_current_x_gate.o: TimeDependentPotassiumCurrentXGate/time_dependent_potassium_current_x_gate.c TimeDependentPotassiumCurrentXGate/time_dependent_potassium_current_x_gate.h $(BASEDIR)/config.h
	@echo Building time_dependent_potassium_current_X_gate...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/time_dependent_potassium_current_xi_gate.o: TimeDependentPotassiumCurrentXiGate/time_dependent_potassium_current_xi_gate.c TimeDependentPotassiumCurrentXiGate/time_dependent_potassium_current_xi_gate.h $(BASEDIR)/config.h
	@echo Building time_dependent_potassium_current_Xi_gate...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/time_independent_potassium_current.o: TimeIndependentPotassiumCurrent/time_independent_potassium_current.c TimeIndependentPotassiumCurrent/time_independent_potassium_current.h $(BASEDIR)/config.h
	@echo Building time_independent_potassium_current...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/time_independent_potassium_current_k1_gate.o: TimeIndependentPotassiumCurrentK1Gate/time_independent_potassium_current_k1_gate.c TimeIndependentPotassiumCurrentK1Gate/time_independent_potassium_current_k1_gate.h $(BASEDIR)/config.h
	@echo Building time_independent_potassium_current_K1_gate...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(TARGET): $(OBJECTSDIR)/l_type_ca_channel.o $(OBJECTSDIR)/l_type_ca_channel_d_gate.o $(OBJECTSDIR)/l_type_ca_channel_f_ca_gate.o $(OBJECTSDIR)/l_type_ca_channel_f_gate.o $(OBJECTSDIR)/na_ca_exchanger.o $(OBJECTSDIR)/calcium_background_current.o $(OBJECTSDIR)/calcium_fluxes_in_the_sr.o $(OBJECTSDIR)/environment.o $(OBJECTSDIR)/fast_sodium_current.o $(OBJECTSDIR)/fast_sodium_current_h_gate.o $(OBJECTSDIR)/fast_sodium_current_j_gate.o $(OBJECTSDIR)/fast_sodium_current_m_gate.o $(OBJECTSDIR)/ionic_concentrations.o $(OBJECTSDIR)/luo_rudy_1994.o $(OBJECTSDIR)/membrane.o $(OBJECTSDIR)/non_specific_calcium_activated_current.o $(OBJECTSDIR)/plateau_potassium_current.o $(OBJECTSDIR)/sarcolemmal_calcium_pump.o $(OBJECTSDIR)/sodium_background_current.o $(OBJECTSDIR)/sodium_potassium_pump.o $(OBJECTSDIR)/time_dependent_potassium_current.o $(OBJECTSDIR)/time_dependent_potassium_current_x_gate.o $(OBJECTSDIR)/time_dependent_potassium_current_xi_gate.o $(OBJECTSDIR)/time_independent_potassium_current.o $(OBJECTSDIR)/time_independent_potassium_current_k1_gate.o
	@echo Building $(TARGET)...
	@rm -f $(TARGET)
	@$(AR) $(ARFLAGS) $(TARGET) $(OBJECTSDIR)/*.o

.PHONY: clean
clean:
	@echo Removing compiled binaries...
	@rm -rf $(TARGET) $(OBJECTSDIR)/* *~