TARGET = tentusscher_2004_mcell.a
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

$(OBJECTSDIR)/l_type_ca_current.o: LTypeCaCurrent/l_type_ca_current.c LTypeCaCurrent/l_type_ca_current.h $(BASEDIR)/config.h
	@echo Building L_type_Ca_current...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/l_type_ca_current_d_gate.o: LTypeCaCurrentDGate/l_type_ca_current_d_gate.c LTypeCaCurrentDGate/l_type_ca_current_d_gate.h $(BASEDIR)/config.h
	@echo Building L_type_Ca_current_d_gate...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/l_type_ca_current_fca_gate.o: LTypeCaCurrentFcaGate/l_type_ca_current_fca_gate.c LTypeCaCurrentFcaGate/l_type_ca_current_fca_gate.h $(BASEDIR)/config.h
	@echo Building L_type_Ca_current_fCa_gate...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/l_type_ca_current_f_gate.o: LTypeCaCurrentFGate/l_type_ca_current_f_gate.c LTypeCaCurrentFGate/l_type_ca_current_f_gate.h $(BASEDIR)/config.h
	@echo Building L_type_Ca_current_f_gate...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/calcium_background_current.o: CalciumBackgroundCurrent/calcium_background_current.c CalciumBackgroundCurrent/calcium_background_current.h $(BASEDIR)/config.h
	@echo Building calcium_background_current...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/calcium_dynamics.o: CalciumDynamics/calcium_dynamics.c CalciumDynamics/calcium_dynamics.h $(BASEDIR)/config.h
	@echo Building calcium_dynamics...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/calcium_pump_current.o: CalciumPumpCurrent/calcium_pump_current.c CalciumPumpCurrent/calcium_pump_current.h $(BASEDIR)/config.h
	@echo Building calcium_pump_current...
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

$(OBJECTSDIR)/inward_rectifier_potassium_current.o: InwardRectifierPotassiumCurrent/inward_rectifier_potassium_current.c InwardRectifierPotassiumCurrent/inward_rectifier_potassium_current.h $(BASEDIR)/config.h
	@echo Building inward_rectifier_potassium_current...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/membrane.o: Membrane/membrane.c Membrane/membrane.h $(BASEDIR)/config.h
	@echo Building membrane...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/potassium_dynamics.o: PotassiumDynamics/potassium_dynamics.c PotassiumDynamics/potassium_dynamics.h $(BASEDIR)/config.h
	@echo Building potassium_dynamics...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/potassium_pump_current.o: PotassiumPumpCurrent/potassium_pump_current.c PotassiumPumpCurrent/potassium_pump_current.h $(BASEDIR)/config.h
	@echo Building potassium_pump_current...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/rapid_time_dependent_potassium_current.o: RapidTimeDependentPotassiumCurrent/rapid_time_dependent_potassium_current.c RapidTimeDependentPotassiumCurrent/rapid_time_dependent_potassium_current.h $(BASEDIR)/config.h
	@echo Building rapid_time_dependent_potassium_current...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/rapid_time_dependent_potassium_current_xr1_gate.o: RapidTimeDependentPotassiumCurrentXr1Gate/rapid_time_dependent_potassium_current_xr1_gate.c RapidTimeDependentPotassiumCurrentXr1Gate/rapid_time_dependent_potassium_current_xr1_gate.h $(BASEDIR)/config.h
	@echo Building rapid_time_dependent_potassium_current_Xr1_gate...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/rapid_time_dependent_potassium_current_xr2_gate.o: RapidTimeDependentPotassiumCurrentXr2Gate/rapid_time_dependent_potassium_current_xr2_gate.c RapidTimeDependentPotassiumCurrentXr2Gate/rapid_time_dependent_potassium_current_xr2_gate.h $(BASEDIR)/config.h
	@echo Building rapid_time_dependent_potassium_current_Xr2_gate...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/reversal_potentials.o: ReversalPotentials/reversal_potentials.c ReversalPotentials/reversal_potentials.h $(BASEDIR)/config.h
	@echo Building reversal_potentials...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/slow_time_dependent_potassium_current.o: SlowTimeDependentPotassiumCurrent/slow_time_dependent_potassium_current.c SlowTimeDependentPotassiumCurrent/slow_time_dependent_potassium_current.h $(BASEDIR)/config.h
	@echo Building slow_time_dependent_potassium_current...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/slow_time_dependent_potassium_current_xs_gate.o: SlowTimeDependentPotassiumCurrentXsGate/slow_time_dependent_potassium_current_xs_gate.c SlowTimeDependentPotassiumCurrentXsGate/slow_time_dependent_potassium_current_xs_gate.h $(BASEDIR)/config.h
	@echo Building slow_time_dependent_potassium_current_Xs_gate...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/sodium_background_current.o: SodiumBackgroundCurrent/sodium_background_current.c SodiumBackgroundCurrent/sodium_background_current.h $(BASEDIR)/config.h
	@echo Building sodium_background_current...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/sodium_calcium_exchanger_current.o: SodiumCalciumExchangerCurrent/sodium_calcium_exchanger_current.c SodiumCalciumExchangerCurrent/sodium_calcium_exchanger_current.h $(BASEDIR)/config.h
	@echo Building sodium_calcium_exchanger_current...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/sodium_dynamics.o: SodiumDynamics/sodium_dynamics.c SodiumDynamics/sodium_dynamics.h $(BASEDIR)/config.h
	@echo Building sodium_dynamics...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/sodium_potassium_pump_current.o: SodiumPotassiumPumpCurrent/sodium_potassium_pump_current.c SodiumPotassiumPumpCurrent/sodium_potassium_pump_current.h $(BASEDIR)/config.h
	@echo Building sodium_potassium_pump_current...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/tentusscher_2004_mcell.o: tentusscher_2004_mcell.c tentusscher_2004_mcell.h $(BASEDIR)/config.h
	@echo Building tentusscher_2004_mcell...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/transient_outward_current.o: TransientOutwardCurrent/transient_outward_current.c TransientOutwardCurrent/transient_outward_current.h $(BASEDIR)/config.h
	@echo Building transient_outward_current...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/transient_outward_current_r_gate.o: TransientOutwardCurrentRGate/transient_outward_current_r_gate.c TransientOutwardCurrentRGate/transient_outward_current_r_gate.h $(BASEDIR)/config.h
	@echo Building transient_outward_current_r_gate...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/transient_outward_current_s_gate.o: TransientOutwardCurrentSGate/transient_outward_current_s_gate.c TransientOutwardCurrentSGate/transient_outward_current_s_gate.h $(BASEDIR)/config.h
	@echo Building transient_outward_current_s_gate...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(TARGET): $(OBJECTSDIR)/l_type_ca_current.o $(OBJECTSDIR)/l_type_ca_current_d_gate.o $(OBJECTSDIR)/l_type_ca_current_fca_gate.o $(OBJECTSDIR)/l_type_ca_current_f_gate.o $(OBJECTSDIR)/calcium_background_current.o $(OBJECTSDIR)/calcium_dynamics.o $(OBJECTSDIR)/calcium_pump_current.o $(OBJECTSDIR)/environment.o $(OBJECTSDIR)/fast_sodium_current.o $(OBJECTSDIR)/fast_sodium_current_h_gate.o $(OBJECTSDIR)/fast_sodium_current_j_gate.o $(OBJECTSDIR)/fast_sodium_current_m_gate.o $(OBJECTSDIR)/inward_rectifier_potassium_current.o $(OBJECTSDIR)/membrane.o $(OBJECTSDIR)/potassium_dynamics.o $(OBJECTSDIR)/potassium_pump_current.o $(OBJECTSDIR)/rapid_time_dependent_potassium_current.o $(OBJECTSDIR)/rapid_time_dependent_potassium_current_xr1_gate.o $(OBJECTSDIR)/rapid_time_dependent_potassium_current_xr2_gate.o $(OBJECTSDIR)/reversal_potentials.o $(OBJECTSDIR)/slow_time_dependent_potassium_current.o $(OBJECTSDIR)/slow_time_dependent_potassium_current_xs_gate.o $(OBJECTSDIR)/sodium_background_current.o $(OBJECTSDIR)/sodium_calcium_exchanger_current.o $(OBJECTSDIR)/sodium_dynamics.o $(OBJECTSDIR)/sodium_potassium_pump_current.o $(OBJECTSDIR)/tentusscher_2004_mcell.o $(OBJECTSDIR)/transient_outward_current.o $(OBJECTSDIR)/transient_outward_current_r_gate.o $(OBJECTSDIR)/transient_outward_current_s_gate.o
	@echo Building $(TARGET)...
	@rm -f $(TARGET)
	@$(AR) $(ARFLAGS) $(TARGET) $(OBJECTSDIR)/*.o

.PHONY: clean
clean:
	@echo Removing compiled binaries...
	@rm -rf $(TARGET) $(OBJECTSDIR)/* *~