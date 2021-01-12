#ifndef LUO_RUDY_1994_H_
#define LUO_RUDY_1994_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#include "Environment/environment.h"
#include "Membrane/membrane.h"
#include "FastSodiumCurrent/fast_sodium_current.h"
#include "FastSodiumCurrentMGate/fast_sodium_current_m_gate.h"
#include "FastSodiumCurrentHGate/fast_sodium_current_h_gate.h"
#include "FastSodiumCurrentJGate/fast_sodium_current_j_gate.h"
#include "LTypeCaChannel/l_type_ca_channel.h"
#include "LTypeCaChannelDGate/l_type_ca_channel_d_gate.h"
#include "LTypeCaChannelFGate/l_type_ca_channel_f_gate.h"
#include "LTypeCaChannelFCaGate/l_type_ca_channel_f_ca_gate.h"
#include "TimeDependentPotassiumCurrent/time_dependent_potassium_current.h"
#include "TimeDependentPotassiumCurrentXGate/time_dependent_potassium_current_x_gate.h"
#include "TimeDependentPotassiumCurrentXiGate/time_dependent_potassium_current_xi_gate.h"
#include "TimeIndependentPotassiumCurrent/time_independent_potassium_current.h"
#include "TimeIndependentPotassiumCurrentK1Gate/time_independent_potassium_current_k1_gate.h"
#include "PlateauPotassiumCurrent/plateau_potassium_current.h"
#include "SarcolemmalCalciumPump/sarcolemmal_calcium_pump.h"
#include "SodiumBackgroundCurrent/sodium_background_current.h"
#include "CalciumBackgroundCurrent/calcium_background_current.h"
#include "SodiumPotassiumPump/sodium_potassium_pump.h"
#include "NonSpecificCalciumActivatedCurrent/non_specific_calcium_activated_current.h"
#include "NaCaExchanger/na_ca_exchanger.h"
#include "CalciumFluxesInTheSr/calcium_fluxes_in_the_sr.h"
#include "IonicConcentrations/ionic_concentrations.h"

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// luo_rudy_1994 Data Struct
typedef struct {
    
    // Declare Outputs
    double environment_time;
    double membrane_v;
    double membrane_r;
    double membrane_t;
    double membrane_f;
    double membrane_dv_dt;
    double membrane_istimc;
    double fast_sodium_current_i_na;
    double fast_sodium_current_e_na;
    double fast_sodium_current_time_private;
    double fast_sodium_current_v_private;
    double fast_sodium_current_m_gate_m;
    double fast_sodium_current_h_gate_h;
    double fast_sodium_current_j_gate_j;
    double l_type_ca_channel_i_ca_l;
    double l_type_ca_channel_i_caca;
    double l_type_ca_channel_i_cak;
    double l_type_ca_channel_i_cana;
    double l_type_ca_channel_gamma_nai;
    double l_type_ca_channel_gamma_nao;
    double l_type_ca_channel_gamma_ki;
    double l_type_ca_channel_gamma_ko;
    double l_type_ca_channel_time_private;
    double l_type_ca_channel_v_private;
    double l_type_ca_channel_cai_private;
    double l_type_ca_channel_d_gate_d;
    double l_type_ca_channel_f_gate_f;
    double l_type_ca_channel_f_ca_gate_f_ca;
    double time_dependent_potassium_current_i_k;
    double time_dependent_potassium_current_time_private;
    double time_dependent_potassium_current_v_private;
    double time_dependent_potassium_current_x_gate_x;
    double time_dependent_potassium_current_xi_gate_xi;
    double time_independent_potassium_current_i_k1;
    double time_independent_potassium_current_e_k1;
    double time_independent_potassium_current_time_private;
    double time_independent_potassium_current_v_private;
    double time_independent_potassium_current_k1_gate_k1_infinity;
    double plateau_potassium_current_i_kp;
    double sarcolemmal_calcium_pump_i_p_ca;
    double sodium_background_current_i_na_b;
    double calcium_background_current_i_ca_b;
    double sodium_potassium_pump_i_nak;
    double non_specific_calcium_activated_current_i_ns_ca;
    double non_specific_calcium_activated_current_i_ns_na;
    double non_specific_calcium_activated_current_i_ns_k;
    double na_ca_exchanger_i_naca;
    double calcium_fluxes_in_the_sr_i_rel;
    double calcium_fluxes_in_the_sr_i_up;
    double calcium_fluxes_in_the_sr_i_leak;
    double calcium_fluxes_in_the_sr_i_tr;
    double ionic_concentrations_nai;
    double ionic_concentrations_nao;
    double ionic_concentrations_cai;
    double ionic_concentrations_cao;
    double ionic_concentrations_ki;
    double ionic_concentrations_ko;
    double ionic_concentrations_ca_jsr;
    double ionic_concentrations_ca_nsr;

    // Declare Daughter Automata
    Environment environment_data;
    Membrane membrane_data;
    FastSodiumCurrent fast_sodium_current_data;
    FastSodiumCurrentMGate fast_sodium_current_m_gate_data;
    FastSodiumCurrentHGate fast_sodium_current_h_gate_data;
    FastSodiumCurrentJGate fast_sodium_current_j_gate_data;
    LTypeCaChannel l_type_ca_channel_data;
    LTypeCaChannelDGate l_type_ca_channel_d_gate_data;
    LTypeCaChannelFGate l_type_ca_channel_f_gate_data;
    LTypeCaChannelFCaGate l_type_ca_channel_f_ca_gate_data;
    TimeDependentPotassiumCurrent time_dependent_potassium_current_data;
    TimeDependentPotassiumCurrentXGate time_dependent_potassium_current_x_gate_data;
    TimeDependentPotassiumCurrentXiGate time_dependent_potassium_current_xi_gate_data;
    TimeIndependentPotassiumCurrent time_independent_potassium_current_data;
    TimeIndependentPotassiumCurrentK1Gate time_independent_potassium_current_k1_gate_data;
    PlateauPotassiumCurrent plateau_potassium_current_data;
    SarcolemmalCalciumPump sarcolemmal_calcium_pump_data;
    SodiumBackgroundCurrent sodium_background_current_data;
    CalciumBackgroundCurrent calcium_background_current_data;
    SodiumPotassiumPump sodium_potassium_pump_data;
    NonSpecificCalciumActivatedCurrent non_specific_calcium_activated_current_data;
    NaCaExchanger na_ca_exchanger_data;
    CalciumFluxesInTheSr calcium_fluxes_in_the_sr_data;
    IonicConcentrations ionic_concentrations_data;
} LuoRudy1994;

// luo_rudy_1994 Initialisation function
void LuoRudy1994Init(LuoRudy1994* me);

// luo_rudy_1994 Execution function
void LuoRudy1994Run(LuoRudy1994* me);

#endif // LUO_RUDY_1994_H_