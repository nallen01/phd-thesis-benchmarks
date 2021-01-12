#ifndef POTASSIUM_CHANNEL_N_GATE_H_
#define POTASSIUM_CHANNEL_N_GATE_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// potassium_channel_n_gate States
enum PotassiumChannelNGateStates {
    POTASSIUM_CHANNEL_N_GATE_Q0,
};

// potassium_channel_n_gate Data Struct
typedef struct {
    
    // Declare Inputs
    double v;
    double time;
    
    // Declare Outputs
    double n;
    
    // Declare Internal Variables
    double alpha_n;
    double beta_n;

    // State
    enum PotassiumChannelNGateStates state;
} PotassiumChannelNGate;

// potassium_channel_n_gate Initialisation function
void PotassiumChannelNGateInit(PotassiumChannelNGate* me);

// potassium_channel_n_gate Execution function
void PotassiumChannelNGateRun(PotassiumChannelNGate* me);

#endif // POTASSIUM_CHANNEL_N_GATE_H_