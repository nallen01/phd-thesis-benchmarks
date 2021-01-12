#ifndef TRANSIENT_OUTWARD_CURRENT_R_GATE_H_
#define TRANSIENT_OUTWARD_CURRENT_R_GATE_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// transient_outward_current_r_gate States
enum TransientOutwardCurrentRGateStates {
    TRANSIENT_OUTWARD_CURRENT_R_GATE_Q0,
};

// transient_outward_current_r_gate Data Struct
typedef struct {
    
    // Declare Inputs
    double v;
    double time;
    
    // Declare Outputs
    double r;
    
    // Declare Internal Variables
    double r_inf;
    double tau_r;

    // State
    enum TransientOutwardCurrentRGateStates state;
} TransientOutwardCurrentRGate;

// transient_outward_current_r_gate Initialisation function
void TransientOutwardCurrentRGateInit(TransientOutwardCurrentRGate* me);

// transient_outward_current_r_gate Execution function
void TransientOutwardCurrentRGateRun(TransientOutwardCurrentRGate* me);

#endif // TRANSIENT_OUTWARD_CURRENT_R_GATE_H_