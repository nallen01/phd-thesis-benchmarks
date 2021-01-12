#include "hodgkin_huxley_squid_axon_1952.h"

// hodgkin_huxley_squid_axon_1952 Initialisation function
void HodgkinHuxleySquidAxon1952Init(HodgkinHuxleySquidAxon1952* me) {
    // Initialise Sub-objects
    EnvironmentInit(&me->environment_data);

    MembraneInit(&me->membrane_data);

    SodiumChannelInit(&me->sodium_channel_data);

    SodiumChannelMGateInit(&me->sodium_channel_m_gate_data);

    SodiumChannelHGateInit(&me->sodium_channel_h_gate_data);

    PotassiumChannelInit(&me->potassium_channel_data);

    PotassiumChannelNGateInit(&me->potassium_channel_n_gate_data);

    LeakageCurrentInit(&me->leakage_current_data);

    // Initialise Outputs
    me->environment_time = me->environment_data.time;
    me->membrane_v = me->membrane_data.v;
    me->membrane_e_r = me->membrane_data.e_r;
    me->sodium_channel_i_na = me->sodium_channel_data.i_na;
    me->sodium_channel_time_private = me->sodium_channel_data.time_private;
    me->sodium_channel_v_private = me->sodium_channel_data.v_private;
    me->sodium_channel_m_gate_m = me->sodium_channel_m_gate_data.m;
    me->sodium_channel_h_gate_h = me->sodium_channel_h_gate_data.h;
    me->potassium_channel_i_k = me->potassium_channel_data.i_k;
    me->potassium_channel_time_private = me->potassium_channel_data.time_private;
    me->potassium_channel_v_private = me->potassium_channel_data.v_private;
    me->potassium_channel_n_gate_n = me->potassium_channel_n_gate_data.n;
    me->leakage_current_i_l = me->leakage_current_data.i_l;
}

// hodgkin_huxley_squid_axon_1952 Execution function
void HodgkinHuxleySquidAxon1952Run(HodgkinHuxleySquidAxon1952* me) {
    // Mappings
    me->leakage_current_data.e_r = me->membrane_data.e_r;
    me->leakage_current_data.v = me->membrane_data.v;
    me->leakage_current_data.time = me->environment_data.time;
    me->membrane_data.i_k = me->potassium_channel_data.i_k;
    me->membrane_data.i_l = me->leakage_current_data.i_l;
    me->membrane_data.i_na = me->sodium_channel_data.i_na;
    me->membrane_data.time = me->environment_data.time;
    me->potassium_channel_data.e_r = me->membrane_data.e_r;
    me->potassium_channel_data.v = me->membrane_data.v;
    me->potassium_channel_data.n_private = me->potassium_channel_n_gate_data.n;
    me->potassium_channel_data.time = me->environment_data.time;
    me->potassium_channel_n_gate_data.v = me->potassium_channel_data.v_private;
    me->potassium_channel_n_gate_data.time = me->potassium_channel_data.time_private;
    me->sodium_channel_data.e_r = me->membrane_data.e_r;
    me->sodium_channel_data.v = me->membrane_data.v;
    me->sodium_channel_data.h_private = me->sodium_channel_h_gate_data.h;
    me->sodium_channel_data.m_private = me->sodium_channel_m_gate_data.m;
    me->sodium_channel_data.time = me->environment_data.time;
    me->sodium_channel_h_gate_data.v = me->sodium_channel_data.v_private;
    me->sodium_channel_h_gate_data.time = me->sodium_channel_data.time_private;
    me->sodium_channel_m_gate_data.v = me->sodium_channel_data.v_private;
    me->sodium_channel_m_gate_data.time = me->sodium_channel_data.time_private;

    // Run Automata
    EnvironmentRun(&me->environment_data);

    MembraneRun(&me->membrane_data);

    SodiumChannelRun(&me->sodium_channel_data);

    SodiumChannelMGateRun(&me->sodium_channel_m_gate_data);

    SodiumChannelHGateRun(&me->sodium_channel_h_gate_data);

    PotassiumChannelRun(&me->potassium_channel_data);

    PotassiumChannelNGateRun(&me->potassium_channel_n_gate_data);

    LeakageCurrentRun(&me->leakage_current_data);

    // Output Mapping
    me->environment_time = me->environment_data.time;
    me->leakage_current_i_l = me->leakage_current_data.i_l;
    me->membrane_e_r = me->membrane_data.e_r;
    me->membrane_v = me->membrane_data.v;
    me->potassium_channel_v_private = me->potassium_channel_data.v_private;
    me->potassium_channel_i_k = me->potassium_channel_data.i_k;
    me->potassium_channel_n_gate_n = me->potassium_channel_n_gate_data.n;
    me->potassium_channel_time_private = me->potassium_channel_data.time_private;
    me->sodium_channel_v_private = me->sodium_channel_data.v_private;
    me->sodium_channel_h_gate_h = me->sodium_channel_h_gate_data.h;
    me->sodium_channel_i_na = me->sodium_channel_data.i_na;
    me->sodium_channel_m_gate_m = me->sodium_channel_m_gate_data.m;
    me->sodium_channel_time_private = me->sodium_channel_data.time_private;
}