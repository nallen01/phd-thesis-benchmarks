#ifndef SODIUM_CHANNEL_M_GATE_H_
#define SODIUM_CHANNEL_M_GATE_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// sodium_channel_m_gate States
enum SodiumChannelMGateStates {
    SODIUM_CHANNEL_M_GATE_Q0,
};

// sodium_channel_m_gate Data Struct
typedef struct {
    
    // Declare Inputs
    double v;
    double time;
    
    // Declare Outputs
    double m;
    
    // Declare Internal Variables
    double alpha_m;
    double beta_m;

    // State
    enum SodiumChannelMGateStates state;
} SodiumChannelMGate;

// sodium_channel_m_gate Initialisation function
void SodiumChannelMGateInit(SodiumChannelMGate* me);

// sodium_channel_m_gate Execution function
void SodiumChannelMGateRun(SodiumChannelMGate* me);

#endif // SODIUM_CHANNEL_M_GATE_H_