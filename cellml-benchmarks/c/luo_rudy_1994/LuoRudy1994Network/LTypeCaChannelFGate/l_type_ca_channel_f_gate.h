#ifndef L_TYPE_CA_CHANNEL_F_GATE_H_
#define L_TYPE_CA_CHANNEL_F_GATE_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// L_type_Ca_channel_f_gate States
enum LTypeCaChannelFGateStates {
    L_TYPE_CA_CHANNEL_F_GATE_Q0,
};

// L_type_Ca_channel_f_gate Data Struct
typedef struct {
    
    // Declare Inputs
    double v;
    double time;
    
    // Declare Outputs
    double f;
    
    // Declare Internal Variables
    double alpha_f;
    double beta_f;
    double f_infinity;
    double tau_f;

    // State
    enum LTypeCaChannelFGateStates state;
} LTypeCaChannelFGate;

// L_type_Ca_channel_f_gate Initialisation function
void LTypeCaChannelFGateInit(LTypeCaChannelFGate* me);

// L_type_Ca_channel_f_gate Execution function
void LTypeCaChannelFGateRun(LTypeCaChannelFGate* me);

#endif // L_TYPE_CA_CHANNEL_F_GATE_H_