#ifndef L_TYPE_CA_CHANNEL_D_GATE_H_
#define L_TYPE_CA_CHANNEL_D_GATE_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// L_type_Ca_channel_d_gate States
enum LTypeCaChannelDGateStates {
    L_TYPE_CA_CHANNEL_D_GATE_Q0,
};

// L_type_Ca_channel_d_gate Data Struct
typedef struct {
    
    // Declare Inputs
    double v;
    double time;
    
    // Declare Outputs
    double d;
    
    // Declare Internal Variables
    double alpha_d;
    double beta_d;
    double d_infinity;
    double tau_d;

    // State
    enum LTypeCaChannelDGateStates state;
} LTypeCaChannelDGate;

// L_type_Ca_channel_d_gate Initialisation function
void LTypeCaChannelDGateInit(LTypeCaChannelDGate* me);

// L_type_Ca_channel_d_gate Execution function
void LTypeCaChannelDGateRun(LTypeCaChannelDGate* me);

#endif // L_TYPE_CA_CHANNEL_D_GATE_H_