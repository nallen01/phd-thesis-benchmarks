#ifndef L_TYPE_CA_CURRENT_D_GATE_H_
#define L_TYPE_CA_CURRENT_D_GATE_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// L_type_Ca_current_d_gate States
enum LTypeCaCurrentDGateStates {
    L_TYPE_CA_CURRENT_D_GATE_Q0,
};

// L_type_Ca_current_d_gate Data Struct
typedef struct {
    
    // Declare Inputs
    double v;
    double time;
    
    // Declare Outputs
    double d;
    
    // Declare Internal Variables
    double d_inf;
    double alpha_d;
    double beta_d;
    double gamma_d;
    double tau_d;

    // State
    enum LTypeCaCurrentDGateStates state;
} LTypeCaCurrentDGate;

// L_type_Ca_current_d_gate Initialisation function
void LTypeCaCurrentDGateInit(LTypeCaCurrentDGate* me);

// L_type_Ca_current_d_gate Execution function
void LTypeCaCurrentDGateRun(LTypeCaCurrentDGate* me);

#endif // L_TYPE_CA_CURRENT_D_GATE_H_