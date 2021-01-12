#ifndef FAST_SODIUM_CURRENT_M_GATE_H_
#define FAST_SODIUM_CURRENT_M_GATE_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// fast_sodium_current_m_gate States
enum FastSodiumCurrentMGateStates {
    FAST_SODIUM_CURRENT_M_GATE_Q0,
};

// fast_sodium_current_m_gate Data Struct
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
    enum FastSodiumCurrentMGateStates state;
} FastSodiumCurrentMGate;

// fast_sodium_current_m_gate Initialisation function
void FastSodiumCurrentMGateInit(FastSodiumCurrentMGate* me);

// fast_sodium_current_m_gate Execution function
void FastSodiumCurrentMGateRun(FastSodiumCurrentMGate* me);

#endif // FAST_SODIUM_CURRENT_M_GATE_H_