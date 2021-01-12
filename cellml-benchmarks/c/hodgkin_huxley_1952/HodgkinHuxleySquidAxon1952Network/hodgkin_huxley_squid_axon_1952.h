#ifndef HODGKIN_HUXLEY_SQUID_AXON_1952_H_
#define HODGKIN_HUXLEY_SQUID_AXON_1952_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#include "Environment/environment.h"
#include "Membrane/membrane.h"
#include "SodiumChannel/sodium_channel.h"
#include "SodiumChannelMGate/sodium_channel_m_gate.h"
#include "SodiumChannelHGate/sodium_channel_h_gate.h"
#include "PotassiumChannel/potassium_channel.h"
#include "PotassiumChannelNGate/potassium_channel_n_gate.h"
#include "LeakageCurrent/leakage_current.h"

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// hodgkin_huxley_squid_axon_1952 Data Struct
typedef struct {
    
    // Declare Outputs
    double environment_time;
    double membrane_v;
    double membrane_e_r;
    double sodium_channel_i_na;
    double sodium_channel_time_private;
    double sodium_channel_v_private;
    double sodium_channel_m_gate_m;
    double sodium_channel_h_gate_h;
    double potassium_channel_i_k;
    double potassium_channel_time_private;
    double potassium_channel_v_private;
    double potassium_channel_n_gate_n;
    double leakage_current_i_l;

    // Declare Daughter Automata
    Environment environment_data;
    Membrane membrane_data;
    SodiumChannel sodium_channel_data;
    SodiumChannelMGate sodium_channel_m_gate_data;
    SodiumChannelHGate sodium_channel_h_gate_data;
    PotassiumChannel potassium_channel_data;
    PotassiumChannelNGate potassium_channel_n_gate_data;
    LeakageCurrent leakage_current_data;
} HodgkinHuxleySquidAxon1952;

// hodgkin_huxley_squid_axon_1952 Initialisation function
void HodgkinHuxleySquidAxon1952Init(HodgkinHuxleySquidAxon1952* me);

// hodgkin_huxley_squid_axon_1952 Execution function
void HodgkinHuxleySquidAxon1952Run(HodgkinHuxleySquidAxon1952* me);

#endif // HODGKIN_HUXLEY_SQUID_AXON_1952_H_