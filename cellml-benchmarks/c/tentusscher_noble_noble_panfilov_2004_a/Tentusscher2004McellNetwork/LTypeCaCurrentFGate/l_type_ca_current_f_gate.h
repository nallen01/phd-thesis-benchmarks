#ifndef L_TYPE_CA_CURRENT_F_GATE_H_
#define L_TYPE_CA_CURRENT_F_GATE_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// L_type_Ca_current_f_gate States
enum LTypeCaCurrentFGateStates {
    L_TYPE_CA_CURRENT_F_GATE_Q0,
};

// L_type_Ca_current_f_gate Data Struct
typedef struct {
    
    // Declare Inputs
    double v;
    double time;
    
    // Declare Outputs
    double f;
    
    // Declare Internal Variables
    double f_inf;
    double tau_f;

    // State
    enum LTypeCaCurrentFGateStates state;
} LTypeCaCurrentFGate;

// L_type_Ca_current_f_gate Initialisation function
void LTypeCaCurrentFGateInit(LTypeCaCurrentFGate* me);

// L_type_Ca_current_f_gate Execution function
void LTypeCaCurrentFGateRun(LTypeCaCurrentFGate* me);

#endif // L_TYPE_CA_CURRENT_F_GATE_H_