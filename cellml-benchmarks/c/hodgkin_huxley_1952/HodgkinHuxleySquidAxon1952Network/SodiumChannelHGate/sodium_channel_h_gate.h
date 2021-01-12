#ifndef SODIUM_CHANNEL_H_GATE_H_
#define SODIUM_CHANNEL_H_GATE_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// sodium_channel_h_gate States
enum SodiumChannelHGateStates {
    SODIUM_CHANNEL_H_GATE_Q0,
};

// sodium_channel_h_gate Data Struct
typedef struct {
    
    // Declare Inputs
    double v;
    double time;
    
    // Declare Outputs
    double h;
    
    // Declare Internal Variables
    double alpha_h;
    double beta_h;

    // State
    enum SodiumChannelHGateStates state;
} SodiumChannelHGate;

// sodium_channel_h_gate Initialisation function
void SodiumChannelHGateInit(SodiumChannelHGate* me);

// sodium_channel_h_gate Execution function
void SodiumChannelHGateRun(SodiumChannelHGate* me);

#endif // SODIUM_CHANNEL_H_GATE_H_