#include "tentusscher_2004_mcell.h"

// tentusscher_2004_mcell Initialisation function
void Tentusscher2004McellInit(Tentusscher2004Mcell* me) {
    // Initialise Sub-objects
    EnvironmentInit(&me->environment_data);

    MembraneInit(&me->membrane_data);

    ReversalPotentialsInit(&me->reversal_potentials_data);

    InwardRectifierPotassiumCurrentInit(&me->inward_rectifier_potassium_current_data);

    RapidTimeDependentPotassiumCurrentInit(&me->rapid_time_dependent_potassium_current_data);

    RapidTimeDependentPotassiumCurrentXr1GateInit(&me->rapid_time_dependent_potassium_current_xr1_gate_data);

    RapidTimeDependentPotassiumCurrentXr2GateInit(&me->rapid_time_dependent_potassium_current_xr2_gate_data);

    SlowTimeDependentPotassiumCurrentInit(&me->slow_time_dependent_potassium_current_data);

    SlowTimeDependentPotassiumCurrentXsGateInit(&me->slow_time_dependent_potassium_current_xs_gate_data);

    FastSodiumCurrentInit(&me->fast_sodium_current_data);

    FastSodiumCurrentMGateInit(&me->fast_sodium_current_m_gate_data);

    FastSodiumCurrentHGateInit(&me->fast_sodium_current_h_gate_data);

    FastSodiumCurrentJGateInit(&me->fast_sodium_current_j_gate_data);

    SodiumBackgroundCurrentInit(&me->sodium_background_current_data);

    LTypeCaCurrentInit(&me->l_type_ca_current_data);

    LTypeCaCurrentDGateInit(&me->l_type_ca_current_d_gate_data);

    LTypeCaCurrentFGateInit(&me->l_type_ca_current_f_gate_data);

    LTypeCaCurrentFcaGateInit(&me->l_type_ca_current_fca_gate_data);

    CalciumBackgroundCurrentInit(&me->calcium_background_current_data);

    TransientOutwardCurrentInit(&me->transient_outward_current_data);

    TransientOutwardCurrentSGateInit(&me->transient_outward_current_s_gate_data);

    TransientOutwardCurrentRGateInit(&me->transient_outward_current_r_gate_data);

    SodiumPotassiumPumpCurrentInit(&me->sodium_potassium_pump_current_data);

    SodiumCalciumExchangerCurrentInit(&me->sodium_calcium_exchanger_current_data);

    CalciumPumpCurrentInit(&me->calcium_pump_current_data);

    PotassiumPumpCurrentInit(&me->potassium_pump_current_data);

    CalciumDynamicsInit(&me->calcium_dynamics_data);

    SodiumDynamicsInit(&me->sodium_dynamics_data);

    PotassiumDynamicsInit(&me->potassium_dynamics_data);

    // Initialise Outputs
    me->environment_time = me->environment_data.time;
    me->membrane_v = me->membrane_data.v;
    me->membrane_r = me->membrane_data.r;
    me->membrane_t = me->membrane_data.t;
    me->membrane_f = me->membrane_data.f;
    me->membrane_cm = me->membrane_data.cm;
    me->membrane_v_c = me->membrane_data.v_c;
    me->membrane_i_stim = me->membrane_data.i_stim;
    me->reversal_potentials_e_na = me->reversal_potentials_data.e_na;
    me->reversal_potentials_e_k = me->reversal_potentials_data.e_k;
    me->reversal_potentials_e_ks = me->reversal_potentials_data.e_ks;
    me->reversal_potentials_e_ca = me->reversal_potentials_data.e_ca;
    me->inward_rectifier_potassium_current_i_k1 = me->inward_rectifier_potassium_current_data.i_k1;
    me->rapid_time_dependent_potassium_current_i_kr = me->rapid_time_dependent_potassium_current_data.i_kr;
    me->rapid_time_dependent_potassium_current_time_private = me->rapid_time_dependent_potassium_current_data.time_private;
    me->rapid_time_dependent_potassium_current_v_private = me->rapid_time_dependent_potassium_current_data.v_private;
    me->rapid_time_dependent_potassium_current_xr1_gate_xr1 = me->rapid_time_dependent_potassium_current_xr1_gate_data.xr1;
    me->rapid_time_dependent_potassium_current_xr2_gate_xr2 = me->rapid_time_dependent_potassium_current_xr2_gate_data.xr2;
    me->slow_time_dependent_potassium_current_i_ks = me->slow_time_dependent_potassium_current_data.i_ks;
    me->slow_time_dependent_potassium_current_time_private = me->slow_time_dependent_potassium_current_data.time_private;
    me->slow_time_dependent_potassium_current_v_private = me->slow_time_dependent_potassium_current_data.v_private;
    me->slow_time_dependent_potassium_current_xs_gate_xs = me->slow_time_dependent_potassium_current_xs_gate_data.xs;
    me->fast_sodium_current_i_na = me->fast_sodium_current_data.i_na;
    me->fast_sodium_current_time_private = me->fast_sodium_current_data.time_private;
    me->fast_sodium_current_v_private = me->fast_sodium_current_data.v_private;
    me->fast_sodium_current_m_gate_m = me->fast_sodium_current_m_gate_data.m;
    me->fast_sodium_current_h_gate_h = me->fast_sodium_current_h_gate_data.h;
    me->fast_sodium_current_j_gate_j = me->fast_sodium_current_j_gate_data.j;
    me->sodium_background_current_i_b_na = me->sodium_background_current_data.i_b_na;
    me->l_type_ca_current_i_cal = me->l_type_ca_current_data.i_cal;
    me->l_type_ca_current_ca_i_private = me->l_type_ca_current_data.ca_i_private;
    me->l_type_ca_current_time_private = me->l_type_ca_current_data.time_private;
    me->l_type_ca_current_v_private = me->l_type_ca_current_data.v_private;
    me->l_type_ca_current_d = me->l_type_ca_current_data.d;
    me->l_type_ca_current_d_gate_d = me->l_type_ca_current_d_gate_data.d;
    me->l_type_ca_current_f_gate_f = me->l_type_ca_current_f_gate_data.f;
    me->l_type_ca_current_fca_gate_fca = me->l_type_ca_current_fca_gate_data.f_ca;
    me->calcium_background_current_i_b_ca = me->calcium_background_current_data.i_b_ca;
    me->transient_outward_current_i_to = me->transient_outward_current_data.i_to;
    me->transient_outward_current_v_private = me->transient_outward_current_data.v_private;
    me->transient_outward_current_time_private = me->transient_outward_current_data.time_private;
    me->transient_outward_current_s_gate_s = me->transient_outward_current_s_gate_data.s;
    me->transient_outward_current_r_gate_r = me->transient_outward_current_r_gate_data.r;
    me->sodium_potassium_pump_current_i_nak = me->sodium_potassium_pump_current_data.i_nak;
    me->sodium_potassium_pump_current_v_private = me->sodium_potassium_pump_current_data.v_private;
    me->sodium_calcium_exchanger_current_i_naca = me->sodium_calcium_exchanger_current_data.i_naca;
    me->calcium_pump_current_i_p_ca = me->calcium_pump_current_data.i_p_ca;
    me->potassium_pump_current_i_p_k = me->potassium_pump_current_data.i_p_k;
    me->calcium_dynamics_ca_i = me->calcium_dynamics_data.ca_i;
    me->calcium_dynamics_ca_o = me->calcium_dynamics_data.ca_o;
    me->sodium_dynamics_na_i = me->sodium_dynamics_data.na_i;
    me->sodium_dynamics_na_o = me->sodium_dynamics_data.na_o;
    me->potassium_dynamics_k_i = me->potassium_dynamics_data.k_i;
    me->potassium_dynamics_k_o = me->potassium_dynamics_data.k_o;
}

// tentusscher_2004_mcell Execution function
void Tentusscher2004McellRun(Tentusscher2004Mcell* me) {
    // Mappings
    me->l_type_ca_current_data.ca_i = me->calcium_dynamics_data.ca_i;
    me->l_type_ca_current_data.ca_o = me->calcium_dynamics_data.ca_o;
    me->l_type_ca_current_data.f = me->membrane_data.f;
    me->l_type_ca_current_data.r = me->membrane_data.r;
    me->l_type_ca_current_data.t = me->membrane_data.t;
    me->l_type_ca_current_data.v = me->membrane_data.v;
    me->l_type_ca_current_data.d_private = me->l_type_ca_current_d_gate_data.d;
    me->l_type_ca_current_data.f1_private = me->l_type_ca_current_f_gate_data.f;
    me->l_type_ca_current_data.fca_private = me->l_type_ca_current_fca_gate_data.f_ca;
    me->l_type_ca_current_data.time = me->environment_data.time;
    me->l_type_ca_current_d_gate_data.v = me->l_type_ca_current_data.v_private;
    me->l_type_ca_current_d_gate_data.time = me->l_type_ca_current_data.time_private;
    me->l_type_ca_current_fca_gate_data.ca_i = me->l_type_ca_current_data.ca_i_private;
    me->l_type_ca_current_fca_gate_data.v = me->l_type_ca_current_data.v_private;
    me->l_type_ca_current_fca_gate_data.time = me->l_type_ca_current_data.time_private;
    me->l_type_ca_current_f_gate_data.v = me->l_type_ca_current_data.v_private;
    me->l_type_ca_current_f_gate_data.time = me->l_type_ca_current_data.time_private;
    me->calcium_background_current_data.e_ca = me->reversal_potentials_data.e_ca;
    me->calcium_background_current_data.v = me->membrane_data.v;
    me->calcium_background_current_data.time = me->environment_data.time;
    me->calcium_dynamics_data.cm = me->membrane_data.cm;
    me->calcium_dynamics_data.f = me->membrane_data.f;
    me->calcium_dynamics_data.v = me->membrane_data.v;
    me->calcium_dynamics_data.v_c = me->membrane_data.v_c;
    me->calcium_dynamics_data.d = me->l_type_ca_current_data.d;
    me->calcium_dynamics_data.i_cal = me->l_type_ca_current_data.i_cal;
    me->calcium_dynamics_data.i_naca = me->sodium_calcium_exchanger_current_data.i_naca;
    me->calcium_dynamics_data.i_b_ca = me->calcium_background_current_data.i_b_ca;
    me->calcium_dynamics_data.i_p_ca = me->calcium_pump_current_data.i_p_ca;
    me->calcium_dynamics_data.time = me->environment_data.time;
    me->calcium_pump_current_data.ca_i = me->calcium_dynamics_data.ca_i;
    me->fast_sodium_current_data.e_na = me->reversal_potentials_data.e_na;
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
    me->inward_rectifier_potassium_current_data.e_k = me->reversal_potentials_data.e_k;
    me->inward_rectifier_potassium_current_data.k_o = me->potassium_dynamics_data.k_o;
    me->inward_rectifier_potassium_current_data.v = me->membrane_data.v;
    me->inward_rectifier_potassium_current_data.time = me->environment_data.time;
    me->membrane_data.i_cal = me->l_type_ca_current_data.i_cal;
    me->membrane_data.i_k1 = me->inward_rectifier_potassium_current_data.i_k1;
    me->membrane_data.i_kr = me->rapid_time_dependent_potassium_current_data.i_kr;
    me->membrane_data.i_ks = me->slow_time_dependent_potassium_current_data.i_ks;
    me->membrane_data.i_na = me->fast_sodium_current_data.i_na;
    me->membrane_data.i_naca = me->sodium_calcium_exchanger_current_data.i_naca;
    me->membrane_data.i_nak = me->sodium_potassium_pump_current_data.i_nak;
    me->membrane_data.i_b_ca = me->calcium_background_current_data.i_b_ca;
    me->membrane_data.i_b_na = me->sodium_background_current_data.i_b_na;
    me->membrane_data.i_p_ca = me->calcium_pump_current_data.i_p_ca;
    me->membrane_data.i_p_k = me->potassium_pump_current_data.i_p_k;
    me->membrane_data.i_to = me->transient_outward_current_data.i_to;
    me->membrane_data.time = me->environment_data.time;
    me->potassium_dynamics_data.cm = me->membrane_data.cm;
    me->potassium_dynamics_data.f = me->membrane_data.f;
    me->potassium_dynamics_data.v_c = me->membrane_data.v_c;
    me->potassium_dynamics_data.i_k1 = me->inward_rectifier_potassium_current_data.i_k1;
    me->potassium_dynamics_data.i_kr = me->rapid_time_dependent_potassium_current_data.i_kr;
    me->potassium_dynamics_data.i_ks = me->slow_time_dependent_potassium_current_data.i_ks;
    me->potassium_dynamics_data.i_nak = me->sodium_potassium_pump_current_data.i_nak;
    me->potassium_dynamics_data.i_stim = me->membrane_data.i_stim;
    me->potassium_dynamics_data.i_p_k = me->potassium_pump_current_data.i_p_k;
    me->potassium_dynamics_data.i_to = me->transient_outward_current_data.i_to;
    me->potassium_dynamics_data.time = me->environment_data.time;
    me->potassium_pump_current_data.e_k = me->reversal_potentials_data.e_k;
    me->potassium_pump_current_data.v = me->membrane_data.v;
    me->rapid_time_dependent_potassium_current_data.e_k = me->reversal_potentials_data.e_k;
    me->rapid_time_dependent_potassium_current_data.k_o = me->potassium_dynamics_data.k_o;
    me->rapid_time_dependent_potassium_current_data.v = me->membrane_data.v;
    me->rapid_time_dependent_potassium_current_data.xr1_private = me->rapid_time_dependent_potassium_current_xr1_gate_data.xr1;
    me->rapid_time_dependent_potassium_current_data.xr2_private = me->rapid_time_dependent_potassium_current_xr2_gate_data.xr2;
    me->rapid_time_dependent_potassium_current_data.time = me->environment_data.time;
    me->rapid_time_dependent_potassium_current_xr1_gate_data.v = me->rapid_time_dependent_potassium_current_data.v_private;
    me->rapid_time_dependent_potassium_current_xr1_gate_data.time = me->rapid_time_dependent_potassium_current_data.time_private;
    me->rapid_time_dependent_potassium_current_xr2_gate_data.v = me->rapid_time_dependent_potassium_current_data.v_private;
    me->rapid_time_dependent_potassium_current_xr2_gate_data.time = me->rapid_time_dependent_potassium_current_data.time_private;
    me->reversal_potentials_data.ca_i = me->calcium_dynamics_data.ca_i;
    me->reversal_potentials_data.ca_o = me->calcium_dynamics_data.ca_o;
    me->reversal_potentials_data.f = me->membrane_data.f;
    me->reversal_potentials_data.k_i = me->potassium_dynamics_data.k_i;
    me->reversal_potentials_data.k_o = me->potassium_dynamics_data.k_o;
    me->reversal_potentials_data.na_i = me->sodium_dynamics_data.na_i;
    me->reversal_potentials_data.na_o = me->sodium_dynamics_data.na_o;
    me->reversal_potentials_data.r = me->membrane_data.r;
    me->reversal_potentials_data.t = me->membrane_data.t;
    me->reversal_potentials_data.time = me->environment_data.time;
    me->slow_time_dependent_potassium_current_data.e_ks = me->reversal_potentials_data.e_ks;
    me->slow_time_dependent_potassium_current_data.v = me->membrane_data.v;
    me->slow_time_dependent_potassium_current_data.xs_private = me->slow_time_dependent_potassium_current_xs_gate_data.xs;
    me->slow_time_dependent_potassium_current_data.time = me->environment_data.time;
    me->slow_time_dependent_potassium_current_xs_gate_data.v = me->slow_time_dependent_potassium_current_data.v_private;
    me->slow_time_dependent_potassium_current_xs_gate_data.time = me->slow_time_dependent_potassium_current_data.time_private;
    me->sodium_background_current_data.e_na = me->reversal_potentials_data.e_na;
    me->sodium_background_current_data.v = me->membrane_data.v;
    me->sodium_background_current_data.time = me->environment_data.time;
    me->sodium_calcium_exchanger_current_data.ca_i = me->calcium_dynamics_data.ca_i;
    me->sodium_calcium_exchanger_current_data.ca_o = me->calcium_dynamics_data.ca_o;
    me->sodium_calcium_exchanger_current_data.f = me->membrane_data.f;
    me->sodium_calcium_exchanger_current_data.na_i = me->sodium_dynamics_data.na_i;
    me->sodium_calcium_exchanger_current_data.na_o = me->sodium_dynamics_data.na_o;
    me->sodium_calcium_exchanger_current_data.r = me->membrane_data.r;
    me->sodium_calcium_exchanger_current_data.t = me->membrane_data.t;
    me->sodium_calcium_exchanger_current_data.v = me->membrane_data.v;
    me->sodium_calcium_exchanger_current_data.time = me->environment_data.time;
    me->sodium_dynamics_data.cm = me->membrane_data.cm;
    me->sodium_dynamics_data.f = me->membrane_data.f;
    me->sodium_dynamics_data.v_c = me->membrane_data.v_c;
    me->sodium_dynamics_data.i_na = me->fast_sodium_current_data.i_na;
    me->sodium_dynamics_data.i_naca = me->sodium_calcium_exchanger_current_data.i_naca;
    me->sodium_dynamics_data.i_nak = me->sodium_potassium_pump_current_data.i_nak;
    me->sodium_dynamics_data.i_b_na = me->sodium_background_current_data.i_b_na;
    me->sodium_dynamics_data.time = me->environment_data.time;
    me->sodium_potassium_pump_current_data.f = me->membrane_data.f;
    me->sodium_potassium_pump_current_data.k_o = me->potassium_dynamics_data.k_o;
    me->sodium_potassium_pump_current_data.na_i = me->sodium_dynamics_data.na_i;
    me->sodium_potassium_pump_current_data.r = me->membrane_data.r;
    me->sodium_potassium_pump_current_data.t = me->membrane_data.t;
    me->sodium_potassium_pump_current_data.v = me->membrane_data.v;
    me->sodium_potassium_pump_current_data.time = me->environment_data.time;
    me->transient_outward_current_data.e_k = me->reversal_potentials_data.e_k;
    me->transient_outward_current_data.v = me->membrane_data.v;
    me->transient_outward_current_data.r_private = me->transient_outward_current_r_gate_data.r;
    me->transient_outward_current_data.s_private = me->transient_outward_current_s_gate_data.s;
    me->transient_outward_current_data.time = me->environment_data.time;
    me->transient_outward_current_r_gate_data.v = me->transient_outward_current_data.v_private;
    me->transient_outward_current_r_gate_data.time = me->transient_outward_current_data.time_private;
    me->transient_outward_current_s_gate_data.v = me->transient_outward_current_data.v_private;
    me->transient_outward_current_s_gate_data.time = me->transient_outward_current_data.time_private;

    // Run Automata
    EnvironmentRun(&me->environment_data);

    MembraneRun(&me->membrane_data);

    ReversalPotentialsRun(&me->reversal_potentials_data);

    InwardRectifierPotassiumCurrentRun(&me->inward_rectifier_potassium_current_data);

    RapidTimeDependentPotassiumCurrentRun(&me->rapid_time_dependent_potassium_current_data);

    RapidTimeDependentPotassiumCurrentXr1GateRun(&me->rapid_time_dependent_potassium_current_xr1_gate_data);

    RapidTimeDependentPotassiumCurrentXr2GateRun(&me->rapid_time_dependent_potassium_current_xr2_gate_data);

    SlowTimeDependentPotassiumCurrentRun(&me->slow_time_dependent_potassium_current_data);

    SlowTimeDependentPotassiumCurrentXsGateRun(&me->slow_time_dependent_potassium_current_xs_gate_data);

    FastSodiumCurrentRun(&me->fast_sodium_current_data);

    FastSodiumCurrentMGateRun(&me->fast_sodium_current_m_gate_data);

    FastSodiumCurrentHGateRun(&me->fast_sodium_current_h_gate_data);

    FastSodiumCurrentJGateRun(&me->fast_sodium_current_j_gate_data);

    SodiumBackgroundCurrentRun(&me->sodium_background_current_data);

    LTypeCaCurrentRun(&me->l_type_ca_current_data);

    LTypeCaCurrentDGateRun(&me->l_type_ca_current_d_gate_data);

    LTypeCaCurrentFGateRun(&me->l_type_ca_current_f_gate_data);

    LTypeCaCurrentFcaGateRun(&me->l_type_ca_current_fca_gate_data);

    CalciumBackgroundCurrentRun(&me->calcium_background_current_data);

    TransientOutwardCurrentRun(&me->transient_outward_current_data);

    TransientOutwardCurrentSGateRun(&me->transient_outward_current_s_gate_data);

    TransientOutwardCurrentRGateRun(&me->transient_outward_current_r_gate_data);

    SodiumPotassiumPumpCurrentRun(&me->sodium_potassium_pump_current_data);

    SodiumCalciumExchangerCurrentRun(&me->sodium_calcium_exchanger_current_data);

    CalciumPumpCurrentRun(&me->calcium_pump_current_data);

    PotassiumPumpCurrentRun(&me->potassium_pump_current_data);

    CalciumDynamicsRun(&me->calcium_dynamics_data);

    SodiumDynamicsRun(&me->sodium_dynamics_data);

    PotassiumDynamicsRun(&me->potassium_dynamics_data);

    // Output Mapping
    me->l_type_ca_current_ca_i_private = me->l_type_ca_current_data.ca_i_private;
    me->l_type_ca_current_v_private = me->l_type_ca_current_data.v_private;
    me->l_type_ca_current_d = me->l_type_ca_current_data.d;
    me->l_type_ca_current_d_gate_d = me->l_type_ca_current_d_gate_data.d;
    me->l_type_ca_current_fca_gate_fca = me->l_type_ca_current_fca_gate_data.f_ca;
    me->l_type_ca_current_f_gate_f = me->l_type_ca_current_f_gate_data.f;
    me->l_type_ca_current_i_cal = me->l_type_ca_current_data.i_cal;
    me->l_type_ca_current_time_private = me->l_type_ca_current_data.time_private;
    me->calcium_background_current_i_b_ca = me->calcium_background_current_data.i_b_ca;
    me->calcium_dynamics_ca_i = me->calcium_dynamics_data.ca_i;
    me->calcium_dynamics_ca_o = me->calcium_dynamics_data.ca_o;
    me->calcium_pump_current_i_p_ca = me->calcium_pump_current_data.i_p_ca;
    me->environment_time = me->environment_data.time;
    me->fast_sodium_current_v_private = me->fast_sodium_current_data.v_private;
    me->fast_sodium_current_h_gate_h = me->fast_sodium_current_h_gate_data.h;
    me->fast_sodium_current_i_na = me->fast_sodium_current_data.i_na;
    me->fast_sodium_current_j_gate_j = me->fast_sodium_current_j_gate_data.j;
    me->fast_sodium_current_m_gate_m = me->fast_sodium_current_m_gate_data.m;
    me->fast_sodium_current_time_private = me->fast_sodium_current_data.time_private;
    me->inward_rectifier_potassium_current_i_k1 = me->inward_rectifier_potassium_current_data.i_k1;
    me->membrane_cm = me->membrane_data.cm;
    me->membrane_f = me->membrane_data.f;
    me->membrane_r = me->membrane_data.r;
    me->membrane_t = me->membrane_data.t;
    me->membrane_v = me->membrane_data.v;
    me->membrane_v_c = me->membrane_data.v_c;
    me->membrane_i_stim = me->membrane_data.i_stim;
    me->potassium_dynamics_k_i = me->potassium_dynamics_data.k_i;
    me->potassium_dynamics_k_o = me->potassium_dynamics_data.k_o;
    me->potassium_pump_current_i_p_k = me->potassium_pump_current_data.i_p_k;
    me->rapid_time_dependent_potassium_current_v_private = me->rapid_time_dependent_potassium_current_data.v_private;
    me->rapid_time_dependent_potassium_current_xr1_gate_xr1 = me->rapid_time_dependent_potassium_current_xr1_gate_data.xr1;
    me->rapid_time_dependent_potassium_current_xr2_gate_xr2 = me->rapid_time_dependent_potassium_current_xr2_gate_data.xr2;
    me->rapid_time_dependent_potassium_current_i_kr = me->rapid_time_dependent_potassium_current_data.i_kr;
    me->rapid_time_dependent_potassium_current_time_private = me->rapid_time_dependent_potassium_current_data.time_private;
    me->reversal_potentials_e_ca = me->reversal_potentials_data.e_ca;
    me->reversal_potentials_e_k = me->reversal_potentials_data.e_k;
    me->reversal_potentials_e_ks = me->reversal_potentials_data.e_ks;
    me->reversal_potentials_e_na = me->reversal_potentials_data.e_na;
    me->slow_time_dependent_potassium_current_v_private = me->slow_time_dependent_potassium_current_data.v_private;
    me->slow_time_dependent_potassium_current_xs_gate_xs = me->slow_time_dependent_potassium_current_xs_gate_data.xs;
    me->slow_time_dependent_potassium_current_i_ks = me->slow_time_dependent_potassium_current_data.i_ks;
    me->slow_time_dependent_potassium_current_time_private = me->slow_time_dependent_potassium_current_data.time_private;
    me->sodium_background_current_i_b_na = me->sodium_background_current_data.i_b_na;
    me->sodium_calcium_exchanger_current_i_naca = me->sodium_calcium_exchanger_current_data.i_naca;
    me->sodium_dynamics_na_i = me->sodium_dynamics_data.na_i;
    me->sodium_dynamics_na_o = me->sodium_dynamics_data.na_o;
    me->sodium_potassium_pump_current_v_private = me->sodium_potassium_pump_current_data.v_private;
    me->sodium_potassium_pump_current_i_nak = me->sodium_potassium_pump_current_data.i_nak;
    me->transient_outward_current_v_private = me->transient_outward_current_data.v_private;
    me->transient_outward_current_i_to = me->transient_outward_current_data.i_to;
    me->transient_outward_current_r_gate_r = me->transient_outward_current_r_gate_data.r;
    me->transient_outward_current_s_gate_s = me->transient_outward_current_s_gate_data.s;
    me->transient_outward_current_time_private = me->transient_outward_current_data.time_private;
}