#ifndef FAST_SODIUM_CURRENT_J_GATE_H_
#define FAST_SODIUM_CURRENT_J_GATE_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// fast_sodium_current_j_gate States
enum FastSodiumCurrentJGateStates {
    FAST_SODIUM_CURRENT_J_GATE_Q0,
};

// fast_sodium_current_j_gate Data Struct
typedef struct {
    
    // Declare Inputs
    double v;
    double time;
    
    // Declare Outputs
    double j;
    
    // Declare Internal Variables
    double alpha_j;
    double beta_j;

    // State
    enum FastSodiumCurrentJGateStates state;
} FastSodiumCurrentJGate;

// fast_sodium_current_j_gate Initialisation function
void FastSodiumCurrentJGateInit(FastSodiumCurrentJGate* me);

// fast_sodium_current_j_gate Execution function
void FastSodiumCurrentJGateRun(FastSodiumCurrentJGate* me);

#endif // FAST_SODIUM_CURRENT_J_GATE_H_