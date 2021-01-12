#ifndef FAST_SODIUM_CURRENT_H_GATE_H_
#define FAST_SODIUM_CURRENT_H_GATE_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// fast_sodium_current_h_gate States
enum FastSodiumCurrentHGateStates {
    FAST_SODIUM_CURRENT_H_GATE_Q0,
};

// fast_sodium_current_h_gate Data Struct
typedef struct {
    
    // Declare Inputs
    double v;
    double time;
    
    // Declare Outputs
    double h;
    
    // Declare Internal Variables
    double h_inf;
    double alpha_h;
    double beta_h;
    double tau_h;

    // State
    enum FastSodiumCurrentHGateStates state;
} FastSodiumCurrentHGate;

// fast_sodium_current_h_gate Initialisation function
void FastSodiumCurrentHGateInit(FastSodiumCurrentHGate* me);

// fast_sodium_current_h_gate Execution function
void FastSodiumCurrentHGateRun(FastSodiumCurrentHGate* me);

#endif // FAST_SODIUM_CURRENT_H_GATE_H_