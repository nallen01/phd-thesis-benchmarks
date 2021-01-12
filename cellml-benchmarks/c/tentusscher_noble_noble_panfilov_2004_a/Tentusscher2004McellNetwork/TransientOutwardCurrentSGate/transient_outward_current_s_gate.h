#ifndef TRANSIENT_OUTWARD_CURRENT_S_GATE_H_
#define TRANSIENT_OUTWARD_CURRENT_S_GATE_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// transient_outward_current_s_gate States
enum TransientOutwardCurrentSGateStates {
    TRANSIENT_OUTWARD_CURRENT_S_GATE_Q0,
};

// transient_outward_current_s_gate Data Struct
typedef struct {
    
    // Declare Inputs
    double v;
    double time;
    
    // Declare Outputs
    double s;
    
    // Declare Internal Variables
    double s_inf;
    double tau_s;

    // State
    enum TransientOutwardCurrentSGateStates state;
} TransientOutwardCurrentSGate;

// transient_outward_current_s_gate Initialisation function
void TransientOutwardCurrentSGateInit(TransientOutwardCurrentSGate* me);

// transient_outward_current_s_gate Execution function
void TransientOutwardCurrentSGateRun(TransientOutwardCurrentSGate* me);

#endif // TRANSIENT_OUTWARD_CURRENT_S_GATE_H_