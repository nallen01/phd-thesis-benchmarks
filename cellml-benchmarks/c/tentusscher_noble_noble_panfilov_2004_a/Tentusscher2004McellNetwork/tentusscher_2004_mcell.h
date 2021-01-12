#ifndef TENTUSSCHER_2004_MCELL_H_
#define TENTUSSCHER_2004_MCELL_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#include "Environment/environment.h"
#include "Membrane/membrane.h"
#include "ReversalPotentials/reversal_potentials.h"
#include "InwardRectifierPotassiumCurrent/inward_rectifier_potassium_current.h"
#include "RapidTimeDependentPotassiumCurrent/rapid_time_dependent_potassium_current.h"
#include "RapidTimeDependentPotassiumCurrentXr1Gate/rapid_time_dependent_potassium_current_xr1_gate.h"
#include "RapidTimeDependentPotassiumCurrentXr2Gate/rapid_time_dependent_potassium_current_xr2_gate.h"
#include "SlowTimeDependentPotassiumCurrent/slow_time_dependent_potassium_current.h"
#include "SlowTimeDependentPotassiumCurrentXsGate/slow_time_dependent_potassium_current_xs_gate.h"
#include "FastSodiumCurrent/fast_sodium_current.h"
#include "FastSodiumCurrentMGate/fast_sodium_current_m_gate.h"
#include "FastSodiumCurrentHGate/fast_sodium_current_h_gate.h"
#include "FastSodiumCurrentJGate/fast_sodium_current_j_gate.h"
#include "SodiumBackgroundCurrent/sodium_background_current.h"
#include "LTypeCaCurrent/l_type_ca_current.h"
#include "LTypeCaCurrentDGate/l_type_ca_current_d_gate.h"
#include "LTypeCaCurrentFGate/l_type_ca_current_f_gate.h"
#include "LTypeCaCurrentFcaGate/l_type_ca_current_fca_gate.h"
#include "CalciumBackgroundCurrent/calcium_background_current.h"
#include "TransientOutwardCurrent/transient_outward_current.h"
#include "TransientOutwardCurrentSGate/transient_outward_current_s_gate.h"
#include "TransientOutwardCurrentRGate/transient_outward_current_r_gate.h"
#include "SodiumPotassiumPumpCurrent/sodium_potassium_pump_current.h"
#include "SodiumCalciumExchangerCurrent/sodium_calcium_exchanger_current.h"
#include "CalciumPumpCurrent/calcium_pump_current.h"
#include "PotassiumPumpCurrent/potassium_pump_current.h"
#include "CalciumDynamics/calcium_dynamics.h"
#include "SodiumDynamics/sodium_dynamics.h"
#include "PotassiumDynamics/potassium_dynamics.h"

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// tentusscher_2004_mcell Data Struct
typedef struct {
    
    // Declare Outputs
    double environment_time;
    double membrane_v;
    double membrane_r;
    double membrane_t;
    double membrane_f;
    double membrane_cm;
    double membrane_v_c;
    double membrane_i_stim;
    double reversal_potentials_e_na;
    double reversal_potentials_e_k;
    double reversal_potentials_e_ks;
    double reversal_potentials_e_ca;
    double inward_rectifier_potassium_current_i_k1;
    double rapid_time_dependent_potassium_current_i_kr;
    double rapid_time_dependent_potassium_current_time_private;
    double rapid_time_dependent_potassium_current_v_private;
    double rapid_time_dependent_potassium_current_xr1_gate_xr1;
    double rapid_time_dependent_potassium_current_xr2_gate_xr2;
    double slow_time_dependent_potassium_current_i_ks;
    double slow_time_dependent_potassium_current_time_private;
    double slow_time_dependent_potassium_current_v_private;
    double slow_time_dependent_potassium_current_xs_gate_xs;
    double fast_sodium_current_i_na;
    double fast_sodium_current_time_private;
    double fast_sodium_current_v_private;
    double fast_sodium_current_m_gate_m;
    double fast_sodium_current_h_gate_h;
    double fast_sodium_current_j_gate_j;
    double sodium_background_current_i_b_na;
    double l_type_ca_current_i_cal;
    double l_type_ca_current_ca_i_private;
    double l_type_ca_current_time_private;
    double l_type_ca_current_v_private;
    double l_type_ca_current_d;
    double l_type_ca_current_d_gate_d;
    double l_type_ca_current_f_gate_f;
    double l_type_ca_current_fca_gate_fca;
    double calcium_background_current_i_b_ca;
    double transient_outward_current_i_to;
    double transient_outward_current_v_private;
    double transient_outward_current_time_private;
    double transient_outward_current_s_gate_s;
    double transient_outward_current_r_gate_r;
    double sodium_potassium_pump_current_i_nak;
    double sodium_potassium_pump_current_v_private;
    double sodium_calcium_exchanger_current_i_naca;
    double calcium_pump_current_i_p_ca;
    double potassium_pump_current_i_p_k;
    double calcium_dynamics_ca_i;
    double calcium_dynamics_ca_o;
    double sodium_dynamics_na_i;
    double sodium_dynamics_na_o;
    double potassium_dynamics_k_i;
    double potassium_dynamics_k_o;

    // Declare Daughter Automata
    Environment environment_data;
    Membrane membrane_data;
    ReversalPotentials reversal_potentials_data;
    InwardRectifierPotassiumCurrent inward_rectifier_potassium_current_data;
    RapidTimeDependentPotassiumCurrent rapid_time_dependent_potassium_current_data;
    RapidTimeDependentPotassiumCurrentXr1Gate rapid_time_dependent_potassium_current_xr1_gate_data;
    RapidTimeDependentPotassiumCurrentXr2Gate rapid_time_dependent_potassium_current_xr2_gate_data;
    SlowTimeDependentPotassiumCurrent slow_time_dependent_potassium_current_data;
    SlowTimeDependentPotassiumCurrentXsGate slow_time_dependent_potassium_current_xs_gate_data;
    FastSodiumCurrent fast_sodium_current_data;
    FastSodiumCurrentMGate fast_sodium_current_m_gate_data;
    FastSodiumCurrentHGate fast_sodium_current_h_gate_data;
    FastSodiumCurrentJGate fast_sodium_current_j_gate_data;
    SodiumBackgroundCurrent sodium_background_current_data;
    LTypeCaCurrent l_type_ca_current_data;
    LTypeCaCurrentDGate l_type_ca_current_d_gate_data;
    LTypeCaCurrentFGate l_type_ca_current_f_gate_data;
    LTypeCaCurrentFcaGate l_type_ca_current_fca_gate_data;
    CalciumBackgroundCurrent calcium_background_current_data;
    TransientOutwardCurrent transient_outward_current_data;
    TransientOutwardCurrentSGate transient_outward_current_s_gate_data;
    TransientOutwardCurrentRGate transient_outward_current_r_gate_data;
    SodiumPotassiumPumpCurrent sodium_potassium_pump_current_data;
    SodiumCalciumExchangerCurrent sodium_calcium_exchanger_current_data;
    CalciumPumpCurrent calcium_pump_current_data;
    PotassiumPumpCurrent potassium_pump_current_data;
    CalciumDynamics calcium_dynamics_data;
    SodiumDynamics sodium_dynamics_data;
    PotassiumDynamics potassium_dynamics_data;
} Tentusscher2004Mcell;

// tentusscher_2004_mcell Initialisation function
void Tentusscher2004McellInit(Tentusscher2004Mcell* me);

// tentusscher_2004_mcell Execution function
void Tentusscher2004McellRun(Tentusscher2004Mcell* me);

#endif // TENTUSSCHER_2004_MCELL_H_