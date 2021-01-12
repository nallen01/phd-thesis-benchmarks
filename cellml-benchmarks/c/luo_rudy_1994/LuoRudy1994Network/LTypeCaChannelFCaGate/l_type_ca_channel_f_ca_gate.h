#ifndef L_TYPE_CA_CHANNEL_F_CA_GATE_H_
#define L_TYPE_CA_CHANNEL_F_CA_GATE_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// L_type_Ca_channel_f_Ca_gate States
enum LTypeCaChannelFCaGateStates {
    L_TYPE_CA_CHANNEL_F_CA_GATE_Q0,
};

// L_type_Ca_channel_f_Ca_gate Data Struct
typedef struct {
    
    // Declare Inputs
    double v;
    double time;
    double cai;
    
    // Declare Outputs
    double f_ca;

    // State
    enum LTypeCaChannelFCaGateStates state;
} LTypeCaChannelFCaGate;

// L_type_Ca_channel_f_Ca_gate Initialisation function
void LTypeCaChannelFCaGateInit(LTypeCaChannelFCaGate* me);

// L_type_Ca_channel_f_Ca_gate Execution function
void LTypeCaChannelFCaGateRun(LTypeCaChannelFCaGate* me);

#endif // L_TYPE_CA_CHANNEL_F_CA_GATE_H_