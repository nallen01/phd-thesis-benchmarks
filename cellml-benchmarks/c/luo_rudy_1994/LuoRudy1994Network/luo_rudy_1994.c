#include "luo_rudy_1994.h"

// luo_rudy_1994 Initialisation function
void LuoRudy1994Init(LuoRudy1994* me) {
    // Initialise Sub-objects
    EnvironmentInit(&me->environment_data);

    MembraneInit(&me->membrane_data);

    FastSodiumCurrentInit(&me->fast_sodium_current_data);

    FastSodiumCurrentMGateInit(&me->fast_sodium_current_m_gate_data);

    FastSodiumCurrentHGateInit(&me->fast_sodium_current_h_gate_data);

    FastSodiumCurrentJGateInit(&me->fast_sodium_current_j_gate_data);

    LTypeCaChannelInit(&me->l_type_ca_channel_data);

    LTypeCaChannelDGateInit(&me->l_type_ca_channel_d_gate_data);

    LTypeCaChannelFGateInit(&me->l_type_ca_channel_f_gate_data);

    LTypeCaChannelFCaGateInit(&me->l_type_ca_channel_f_ca_gate_data);

    TimeDependentPotassiumCurrentInit(&me->time_dependent_potassium_current_data);

    TimeDependentPotassiumCurrentXGateInit(&me->time_dependent_potassium_current_x_gate_data);

    TimeDependentPotassiumCurrentXiGateInit(&me->time_dependent_potassium_current_xi_gate_data);

    TimeIndependentPotassiumCurrentInit(&me->time_independent_potassium_current_data);

    TimeIndependentPotassiumCurrentK1GateInit(&me->time_independent_potassium_current_k1_gate_data);

    PlateauPotassiumCurrentInit(&me->plateau_potassium_current_data);

    SarcolemmalCalciumPumpInit(&me->sarcolemmal_calcium_pump_data);

    SodiumBackgroundCurrentInit(&me->sodium_background_current_data);

    CalciumBackgroundCurrentInit(&me->calcium_background_current_data);

    SodiumPotassiumPumpInit(&me->sodium_potassium_pump_data);

    NonSpecificCalciumActivatedCurrentInit(&me->non_specific_calcium_activated_current_data);

    NaCaExchangerInit(&me->na_ca_exchanger_data);

    CalciumFluxesInTheSrInit(&me->calcium_fluxes_in_the_sr_data);

    IonicConcentrationsInit(&me->ionic_concentrations_data);

    // Initialise Outputs
    me->environment_time = me->environment_data.time;
    me->membrane_v = me->membrane_data.v;
    me->membrane_r = me->membrane_data.r;
    me->membrane_t = me->membrane_data.t;
    me->membrane_f = me->membrane_data.f;
    me->membrane_dv_dt = me->membrane_data.dv_dt;
    me->membrane_istimc = me->membrane_data.i_stim_c;
    me->fast_sodium_current_i_na = me->fast_sodium_current_data.i_na;
    me->fast_sodium_current_e_na = me->fast_sodium_current_data.e_na;
    me->fast_sodium_current_time_private = me->fast_sodium_current_data.time_private;
    me->fast_sodium_current_v_private = me->fast_sodium_current_data.v_private;
    me->fast_sodium_current_m_gate_m = me->fast_sodium_current_m_gate_data.m;
    me->fast_sodium_current_h_gate_h = me->fast_sodium_current_h_gate_data.h;
    me->fast_sodium_current_j_gate_j = me->fast_sodium_current_j_gate_data.j;
    me->l_type_ca_channel_i_ca_l = me->l_type_ca_channel_data.i_ca_l;
    me->l_type_ca_channel_i_caca = me->l_type_ca_channel_data.i_caca;
    me->l_type_ca_channel_i_cak = me->l_type_ca_channel_data.i_cak;
    me->l_type_ca_channel_i_cana = me->l_type_ca_channel_data.i_cana;
    me->l_type_ca_channel_gamma_nai = me->l_type_ca_channel_data.gamma_nai;
    me->l_type_ca_channel_gamma_nao = me->l_type_ca_channel_data.gamma_nao;
    me->l_type_ca_channel_gamma_ki = me->l_type_ca_channel_data.gamma_ki;
    me->l_type_ca_channel_gamma_ko = me->l_type_ca_channel_data.gamma_ko;
    me->l_type_ca_channel_time_private = me->l_type_ca_channel_data.time_private;
    me->l_type_ca_channel_v_private = me->l_type_ca_channel_data.v_private;
    me->l_type_ca_channel_cai_private = me->l_type_ca_channel_data.cai_private;
    me->l_type_ca_channel_d_gate_d = me->l_type_ca_channel_d_gate_data.d;
    me->l_type_ca_channel_f_gate_f = me->l_type_ca_channel_f_gate_data.f;
    me->l_type_ca_channel_f_ca_gate_f_ca = me->l_type_ca_channel_f_ca_gate_data.f_ca;
    me->time_dependent_potassium_current_i_k = me->time_dependent_potassium_current_data.i_k;
    me->time_dependent_potassium_current_time_private = me->time_dependent_potassium_current_data.time_private;
    me->time_dependent_potassium_current_v_private = me->time_dependent_potassium_current_data.v_private;
    me->time_dependent_potassium_current_x_gate_x = me->time_dependent_potassium_current_x_gate_data.x;
    me->time_dependent_potassium_current_xi_gate_xi = me->time_dependent_potassium_current_xi_gate_data.xi;
    me->time_independent_potassium_current_i_k1 = me->time_independent_potassium_current_data.i_k1;
    me->time_independent_potassium_current_e_k1 = me->time_independent_potassium_current_data.e_k1;
    me->time_independent_potassium_current_time_private = me->time_independent_potassium_current_data.time_private;
    me->time_independent_potassium_current_v_private = me->time_independent_potassium_current_data.v_private;
    me->time_independent_potassium_current_k1_gate_k1_infinity = me->time_independent_potassium_current_k1_gate_data.k1_infinity;
    me->plateau_potassium_current_i_kp = me->plateau_potassium_current_data.i_kp;
    me->sarcolemmal_calcium_pump_i_p_ca = me->sarcolemmal_calcium_pump_data.i_p_ca;
    me->sodium_background_current_i_na_b = me->sodium_background_current_data.i_na_b;
    me->calcium_background_current_i_ca_b = me->calcium_background_current_data.i_ca_b;
    me->sodium_potassium_pump_i_nak = me->sodium_potassium_pump_data.i_nak;
    me->non_specific_calcium_activated_current_i_ns_ca = me->non_specific_calcium_activated_current_data.i_ns_ca;
    me->non_specific_calcium_activated_current_i_ns_na = me->non_specific_calcium_activated_current_data.i_ns_na;
    me->non_specific_calcium_activated_current_i_ns_k = me->non_specific_calcium_activated_current_data.i_ns_k;
    me->na_ca_exchanger_i_naca = me->na_ca_exchanger_data.i_naca;
    me->calcium_fluxes_in_the_sr_i_rel = me->calcium_fluxes_in_the_sr_data.i_rel;
    me->calcium_fluxes_in_the_sr_i_up = me->calcium_fluxes_in_the_sr_data.i_up;
    me->calcium_fluxes_in_the_sr_i_leak = me->calcium_fluxes_in_the_sr_data.i_leak;
    me->calcium_fluxes_in_the_sr_i_tr = me->calcium_fluxes_in_the_sr_data.i_tr;
    me->ionic_concentrations_nai = me->ionic_concentrations_data.nai;
    me->ionic_concentrations_nao = me->ionic_concentrations_data.nao;
    me->ionic_concentrations_cai = me->ionic_concentrations_data.cai;
    me->ionic_concentrations_cao = me->ionic_concentrations_data.cao;
    me->ionic_concentrations_ki = me->ionic_concentrations_data.ki;
    me->ionic_concentrations_ko = me->ionic_concentrations_data.ko;
    me->ionic_concentrations_ca_jsr = me->ionic_concentrations_data.ca_jsr;
    me->ionic_concentrations_ca_nsr = me->ionic_concentrations_data.ca_nsr;
}

// luo_rudy_1994 Execution function
void LuoRudy1994Run(LuoRudy1994* me) {
    // Mappings
    me->l_type_ca_channel_data.cai = me->ionic_concentrations_data.cai;
    me->l_type_ca_channel_data.cao = me->ionic_concentrations_data.cao;
    me->l_type_ca_channel_data.f = me->membrane_data.f;
    me->l_type_ca_channel_data.ki = me->ionic_concentrations_data.ki;
    me->l_type_ca_channel_data.ko = me->ionic_concentrations_data.ko;
    me->l_type_ca_channel_data.nai = me->ionic_concentrations_data.nai;
    me->l_type_ca_channel_data.nao = me->ionic_concentrations_data.nao;
    me->l_type_ca_channel_data.r = me->membrane_data.r;
    me->l_type_ca_channel_data.t = me->membrane_data.t;
    me->l_type_ca_channel_data.v = me->membrane_data.v;
    me->l_type_ca_channel_data.d_private = me->l_type_ca_channel_d_gate_data.d;
    me->l_type_ca_channel_data.f1_private = me->l_type_ca_channel_f_gate_data.f;
    me->l_type_ca_channel_data.f_ca_private = me->l_type_ca_channel_f_ca_gate_data.f_ca;
    me->l_type_ca_channel_data.time = me->environment_data.time;
    me->l_type_ca_channel_d_gate_data.v = me->l_type_ca_channel_data.v_private;
    me->l_type_ca_channel_d_gate_data.time = me->l_type_ca_channel_data.time_private;
    me->l_type_ca_channel_f_ca_gate_data.cai = me->l_type_ca_channel_data.cai_private;
    me->l_type_ca_channel_f_ca_gate_data.v = me->l_type_ca_channel_data.v_private;
    me->l_type_ca_channel_f_ca_gate_data.time = me->l_type_ca_channel_data.time_private;
    me->l_type_ca_channel_f_gate_data.v = me->l_type_ca_channel_data.v_private;
    me->l_type_ca_channel_f_gate_data.time = me->l_type_ca_channel_data.time_private;
    me->na_ca_exchanger_data.cai = me->ionic_concentrations_data.cai;
    me->na_ca_exchanger_data.cao = me->ionic_concentrations_data.cao;
    me->na_ca_exchanger_data.f = me->membrane_data.f;
    me->na_ca_exchanger_data.nai = me->ionic_concentrations_data.nai;
    me->na_ca_exchanger_data.nao = me->ionic_concentrations_data.nao;
    me->na_ca_exchanger_data.r = me->membrane_data.r;
    me->na_ca_exchanger_data.t = me->membrane_data.t;
    me->na_ca_exchanger_data.v = me->membrane_data.v;
    me->na_ca_exchanger_data.time = me->environment_data.time;
    me->calcium_background_current_data.cai = me->ionic_concentrations_data.cai;
    me->calcium_background_current_data.cao = me->ionic_concentrations_data.cao;
    me->calcium_background_current_data.f = me->membrane_data.f;
    me->calcium_background_current_data.r = me->membrane_data.r;
    me->calcium_background_current_data.t = me->membrane_data.t;
    me->calcium_background_current_data.v = me->membrane_data.v;
    me->calcium_background_current_data.time = me->environment_data.time;
    me->calcium_fluxes_in_the_sr_data.ca_jsr = me->ionic_concentrations_data.ca_jsr;
    me->calcium_fluxes_in_the_sr_data.ca_nsr = me->ionic_concentrations_data.ca_nsr;
    me->calcium_fluxes_in_the_sr_data.cai = me->ionic_concentrations_data.cai;
    me->calcium_fluxes_in_the_sr_data.time = me->environment_data.time;
    me->fast_sodium_current_data.f = me->membrane_data.f;
    me->fast_sodium_current_data.nai = me->ionic_concentrations_data.nai;
    me->fast_sodium_current_data.nao = me->ionic_concentrations_data.nao;
    me->fast_sodium_current_data.r = me->membrane_data.r;
    me->fast_sodium_current_data.t = me->membrane_data.t;
    me->fast_sodium_current_data.v = me->membrane_data.v;
    me->fast_sodium_current_data.h_private = me->fast_sodium_current_h_gate_data.h;
    me->fast_sodium_current_data.j_private = me->fast_sodium_current_j_gate_data.j;
    me->fast_sodium_current_data.m_private = me->fast_sodium_current_m_gate_data.m;
    me->fast_sodium_current_data.time = me->environment_data.time;
    me->fast_sodium_current_h_gate_data.v = me->fast_sodium_current_data.v_private;
    me->fast_sodium_current_h_gate_data.time = me->fast_sodium_current_data.time_private;
    me->fast_sodium_current_j_gate_data.v = me->fast_sodium_current_data.v_private;
    me->fast_sodium_current_j_gate_data.time = me->fast_sodium_current_data.time_private;
    me->fast_sodium_current_m_gate_data.v = me->fast_sodium_current_data.v_private;
    me->fast_sodium_current_m_gate_data.time = me->fast_sodium_current_data.time_private;
    me->ionic_concentrations_data.f = me->membrane_data.f;
    me->ionic_concentrations_data.i_caca = me->l_type_ca_channel_data.i_caca;
    me->ionic_concentrations_data.i_cak = me->l_type_ca_channel_data.i_cak;
    me->ionic_concentrations_data.i_cana = me->l_type_ca_channel_data.i_cana;
    me->ionic_concentrations_data.i_ca_b = me->calcium_background_current_data.i_ca_b;
    me->ionic_concentrations_data.i_k = me->time_dependent_potassium_current_data.i_k;
    me->ionic_concentrations_data.i_k1 = me->time_independent_potassium_current_data.i_k1;
    me->ionic_concentrations_data.i_kp = me->plateau_potassium_current_data.i_kp;
    me->ionic_concentrations_data.i_na = me->fast_sodium_current_data.i_na;
    me->ionic_concentrations_data.i_naca = me->na_ca_exchanger_data.i_naca;
    me->ionic_concentrations_data.i_nak = me->sodium_potassium_pump_data.i_nak;
    me->ionic_concentrations_data.i_na_b = me->sodium_background_current_data.i_na_b;
    me->ionic_concentrations_data.i_leak = me->calcium_fluxes_in_the_sr_data.i_leak;
    me->ionic_concentrations_data.i_ns_k = me->non_specific_calcium_activated_current_data.i_ns_k;
    me->ionic_concentrations_data.i_ns_na = me->non_specific_calcium_activated_current_data.i_ns_na;
    me->ionic_concentrations_data.i_p_ca = me->sarcolemmal_calcium_pump_data.i_p_ca;
    me->ionic_concentrations_data.i_rel = me->calcium_fluxes_in_the_sr_data.i_rel;
    me->ionic_concentrations_data.i_tr = me->calcium_fluxes_in_the_sr_data.i_tr;
    me->ionic_concentrations_data.i_up = me->calcium_fluxes_in_the_sr_data.i_up;
    me->ionic_concentrations_data.time = me->environment_data.time;
    me->membrane_data.i_ca_l = me->l_type_ca_channel_data.i_ca_l;
    me->membrane_data.i_ca_b = me->calcium_background_current_data.i_ca_b;
    me->membrane_data.i_k = me->time_dependent_potassium_current_data.i_k;
    me->membrane_data.i_k1 = me->time_independent_potassium_current_data.i_k1;
    me->membrane_data.i_kp = me->plateau_potassium_current_data.i_kp;
    me->membrane_data.i_na = me->fast_sodium_current_data.i_na;
    me->membrane_data.i_naca = me->na_ca_exchanger_data.i_naca;
    me->membrane_data.i_nak = me->sodium_potassium_pump_data.i_nak;
    me->membrane_data.i_na_b = me->sodium_background_current_data.i_na_b;
    me->membrane_data.i_ns_ca = me->non_specific_calcium_activated_current_data.i_ns_ca;
    me->membrane_data.i_p_ca = me->sarcolemmal_calcium_pump_data.i_p_ca;
    me->membrane_data.time = me->environment_data.time;
    me->non_specific_calcium_activated_current_data.cai = me->ionic_concentrations_data.cai;
    me->non_specific_calcium_activated_current_data.cao = me->ionic_concentrations_data.cao;
    me->non_specific_calcium_activated_current_data.f = me->membrane_data.f;
    me->non_specific_calcium_activated_current_data.ki = me->ionic_concentrations_data.ki;
    me->non_specific_calcium_activated_current_data.ko = me->ionic_concentrations_data.ko;
    me->non_specific_calcium_activated_current_data.nai = me->ionic_concentrations_data.nai;
    me->non_specific_calcium_activated_current_data.nao = me->ionic_concentrations_data.nao;
    me->non_specific_calcium_activated_current_data.r = me->membrane_data.r;
    me->non_specific_calcium_activated_current_data.t = me->membrane_data.t;
    me->non_specific_calcium_activated_current_data.v = me->membrane_data.v;
    me->non_specific_calcium_activated_current_data.gamma_ki = me->l_type_ca_channel_data.gamma_ki;
    me->non_specific_calcium_activated_current_data.gamma_ko = me->l_type_ca_channel_data.gamma_ko;
    me->non_specific_calcium_activated_current_data.gamma_nai = me->l_type_ca_channel_data.gamma_nai;
    me->non_specific_calcium_activated_current_data.gamma_nao = me->l_type_ca_channel_data.gamma_nao;
    me->non_specific_calcium_activated_current_data.time = me->environment_data.time;
    me->plateau_potassium_current_data.e_k1 = me->time_independent_potassium_current_data.e_k1;
    me->plateau_potassium_current_data.v = me->membrane_data.v;
    me->plateau_potassium_current_data.time = me->environment_data.time;
    me->sarcolemmal_calcium_pump_data.cai = me->ionic_concentrations_data.cai;
    me->sarcolemmal_calcium_pump_data.time = me->environment_data.time;
    me->sodium_background_current_data.e_na = me->fast_sodium_current_data.e_na;
    me->sodium_background_current_data.v = me->membrane_data.v;
    me->sodium_background_current_data.time = me->environment_data.time;
    me->sodium_potassium_pump_data.f = me->membrane_data.f;
    me->sodium_potassium_pump_data.ko = me->ionic_concentrations_data.ko;
    me->sodium_potassium_pump_data.nai = me->ionic_concentrations_data.nai;
    me->sodium_potassium_pump_data.nao = me->ionic_concentrations_data.nao;
    me->sodium_potassium_pump_data.r = me->membrane_data.r;
    me->sodium_potassium_pump_data.t = me->membrane_data.t;
    me->sodium_potassium_pump_data.v = me->membrane_data.v;
    me->sodium_potassium_pump_data.time = me->environment_data.time;
    me->time_dependent_potassium_current_data.f = me->membrane_data.f;
    me->time_dependent_potassium_current_data.ki = me->ionic_concentrations_data.ki;
    me->time_dependent_potassium_current_data.ko = me->ionic_concentrations_data.ko;
    me->time_dependent_potassium_current_data.nai = me->ionic_concentrations_data.nai;
    me->time_dependent_potassium_current_data.nao = me->ionic_concentrations_data.nao;
    me->time_dependent_potassium_current_data.r = me->membrane_data.r;
    me->time_dependent_potassium_current_data.t = me->membrane_data.t;
    me->time_dependent_potassium_current_data.v = me->membrane_data.v;
    me->time_dependent_potassium_current_data.x_private = me->time_dependent_potassium_current_x_gate_data.x;
    me->time_dependent_potassium_current_data.xi_private = me->time_dependent_potassium_current_xi_gate_data.xi;
    me->time_dependent_potassium_current_data.time = me->environment_data.time;
    me->time_dependent_potassium_current_x_gate_data.v = me->time_dependent_potassium_current_data.v_private;
    me->time_dependent_potassium_current_x_gate_data.time = me->time_dependent_potassium_current_data.time_private;
    me->time_dependent_potassium_current_xi_gate_data.v = me->time_dependent_potassium_current_data.v_private;
    me->time_dependent_potassium_current_xi_gate_data.time = me->time_dependent_potassium_current_data.time_private;
    me->time_independent_potassium_current_data.f = me->membrane_data.f;
    me->time_independent_potassium_current_data.k1_infinity_private = me->time_independent_potassium_current_k1_gate_data.k1_infinity;
    me->time_independent_potassium_current_data.ki = me->ionic_concentrations_data.ki;
    me->time_independent_potassium_current_data.ko = me->ionic_concentrations_data.ko;
    me->time_independent_potassium_current_data.r = me->membrane_data.r;
    me->time_independent_potassium_current_data.t = me->membrane_data.t;
    me->time_independent_potassium_current_data.v = me->membrane_data.v;
    me->time_independent_potassium_current_data.time = me->environment_data.time;
    me->time_independent_potassium_current_k1_gate_data.e_k1 = me->time_independent_potassium_current_data.e_k1;
    me->time_independent_potassium_current_k1_gate_data.v = me->time_independent_potassium_current_data.v_private;
    me->time_independent_potassium_current_k1_gate_data.time = me->time_independent_potassium_current_data.time_private;

    // Run Automata
    EnvironmentRun(&me->environment_data);

    MembraneRun(&me->membrane_data);

    FastSodiumCurrentRun(&me->fast_sodium_current_data);

    FastSodiumCurrentMGateRun(&me->fast_sodium_current_m_gate_data);

    FastSodiumCurrentHGateRun(&me->fast_sodium_current_h_gate_data);

    FastSodiumCurrentJGateRun(&me->fast_sodium_current_j_gate_data);

    LTypeCaChannelRun(&me->l_type_ca_channel_data);

    LTypeCaChannelDGateRun(&me->l_type_ca_channel_d_gate_data);

    LTypeCaChannelFGateRun(&me->l_type_ca_channel_f_gate_data);

    LTypeCaChannelFCaGateRun(&me->l_type_ca_channel_f_ca_gate_data);

    TimeDependentPotassiumCurrentRun(&me->time_dependent_potassium_current_data);

    TimeDependentPotassiumCurrentXGateRun(&me->time_dependent_potassium_current_x_gate_data);

    TimeDependentPotassiumCurrentXiGateRun(&me->time_dependent_potassium_current_xi_gate_data);

    TimeIndependentPotassiumCurrentRun(&me->time_independent_potassium_current_data);

    TimeIndependentPotassiumCurrentK1GateRun(&me->time_independent_potassium_current_k1_gate_data);

    PlateauPotassiumCurrentRun(&me->plateau_potassium_current_data);

    SarcolemmalCalciumPumpRun(&me->sarcolemmal_calcium_pump_data);

    SodiumBackgroundCurrentRun(&me->sodium_background_current_data);

    CalciumBackgroundCurrentRun(&me->calcium_background_current_data);

    SodiumPotassiumPumpRun(&me->sodium_potassium_pump_data);

    NonSpecificCalciumActivatedCurrentRun(&me->non_specific_calcium_activated_current_data);

    NaCaExchangerRun(&me->na_ca_exchanger_data);

    CalciumFluxesInTheSrRun(&me->calcium_fluxes_in_the_sr_data);

    IonicConcentrationsRun(&me->ionic_concentrations_data);

    // Output Mapping
    me->l_type_ca_channel_cai_private = me->l_type_ca_channel_data.cai_private;
    me->l_type_ca_channel_v_private = me->l_type_ca_channel_data.v_private;
    me->l_type_ca_channel_d_gate_d = me->l_type_ca_channel_d_gate_data.d;
    me->l_type_ca_channel_f_ca_gate_f_ca = me->l_type_ca_channel_f_ca_gate_data.f_ca;
    me->l_type_ca_channel_f_gate_f = me->l_type_ca_channel_f_gate_data.f;
    me->l_type_ca_channel_gamma_ki = me->l_type_ca_channel_data.gamma_ki;
    me->l_type_ca_channel_gamma_ko = me->l_type_ca_channel_data.gamma_ko;
    me->l_type_ca_channel_gamma_nai = me->l_type_ca_channel_data.gamma_nai;
    me->l_type_ca_channel_gamma_nao = me->l_type_ca_channel_data.gamma_nao;
    me->l_type_ca_channel_i_caca = me->l_type_ca_channel_data.i_caca;
    me->l_type_ca_channel_i_cak = me->l_type_ca_channel_data.i_cak;
    me->l_type_ca_channel_i_cana = me->l_type_ca_channel_data.i_cana;
    me->l_type_ca_channel_i_ca_l = me->l_type_ca_channel_data.i_ca_l;
    me->l_type_ca_channel_time_private = me->l_type_ca_channel_data.time_private;
    me->na_ca_exchanger_i_naca = me->na_ca_exchanger_data.i_naca;
    me->calcium_background_current_i_ca_b = me->calcium_background_current_data.i_ca_b;
    me->calcium_fluxes_in_the_sr_i_leak = me->calcium_fluxes_in_the_sr_data.i_leak;
    me->calcium_fluxes_in_the_sr_i_rel = me->calcium_fluxes_in_the_sr_data.i_rel;
    me->calcium_fluxes_in_the_sr_i_tr = me->calcium_fluxes_in_the_sr_data.i_tr;
    me->calcium_fluxes_in_the_sr_i_up = me->calcium_fluxes_in_the_sr_data.i_up;
    me->environment_time = me->environment_data.time;
    me->fast_sodium_current_e_na = me->fast_sodium_current_data.e_na;
    me->fast_sodium_current_v_private = me->fast_sodium_current_data.v_private;
    me->fast_sodium_current_h_gate_h = me->fast_sodium_current_h_gate_data.h;
    me->fast_sodium_current_i_na = me->fast_sodium_current_data.i_na;
    me->fast_sodium_current_j_gate_j = me->fast_sodium_current_j_gate_data.j;
    me->fast_sodium_current_m_gate_m = me->fast_sodium_current_m_gate_data.m;
    me->fast_sodium_current_time_private = me->fast_sodium_current_data.time_private;
    me->ionic_concentrations_ca_jsr = me->ionic_concentrations_data.ca_jsr;
    me->ionic_concentrations_ca_nsr = me->ionic_concentrations_data.ca_nsr;
    me->ionic_concentrations_cai = me->ionic_concentrations_data.cai;
    me->ionic_concentrations_cao = me->ionic_concentrations_data.cao;
    me->ionic_concentrations_ki = me->ionic_concentrations_data.ki;
    me->ionic_concentrations_ko = me->ionic_concentrations_data.ko;
    me->ionic_concentrations_nai = me->ionic_concentrations_data.nai;
    me->ionic_concentrations_nao = me->ionic_concentrations_data.nao;
    me->membrane_f = me->membrane_data.f;
    me->membrane_istimc = me->membrane_data.i_stim_c;
    me->membrane_r = me->membrane_data.r;
    me->membrane_t = me->membrane_data.t;
    me->membrane_v = me->membrane_data.v;
    me->membrane_dv_dt = me->membrane_data.dv_dt;
    me->non_specific_calcium_activated_current_i_ns_ca = me->non_specific_calcium_activated_current_data.i_ns_ca;
    me->non_specific_calcium_activated_current_i_ns_k = me->non_specific_calcium_activated_current_data.i_ns_k;
    me->non_specific_calcium_activated_current_i_ns_na = me->non_specific_calcium_activated_current_data.i_ns_na;
    me->plateau_potassium_current_i_kp = me->plateau_potassium_current_data.i_kp;
    me->sarcolemmal_calcium_pump_i_p_ca = me->sarcolemmal_calcium_pump_data.i_p_ca;
    me->sodium_background_current_i_na_b = me->sodium_background_current_data.i_na_b;
    me->sodium_potassium_pump_i_nak = me->sodium_potassium_pump_data.i_nak;
    me->time_dependent_potassium_current_v_private = me->time_dependent_potassium_current_data.v_private;
    me->time_dependent_potassium_current_x_gate_x = me->time_dependent_potassium_current_x_gate_data.x;
    me->time_dependent_potassium_current_xi_gate_xi = me->time_dependent_potassium_current_xi_gate_data.xi;
    me->time_dependent_potassium_current_i_k = me->time_dependent_potassium_current_data.i_k;
    me->time_dependent_potassium_current_time_private = me->time_dependent_potassium_current_data.time_private;
    me->time_independent_potassium_current_e_k1 = me->time_independent_potassium_current_data.e_k1;
    me->time_independent_potassium_current_k1_gate_k1_infinity = me->time_independent_potassium_current_k1_gate_data.k1_infinity;
    me->time_independent_potassium_current_v_private = me->time_independent_potassium_current_data.v_private;
    me->time_independent_potassium_current_i_k1 = me->time_independent_potassium_current_data.i_k1;
    me->time_independent_potassium_current_time_private = me->time_independent_potassium_current_data.time_private;
}