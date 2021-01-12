#ifndef L_TYPE_CA_CURRENT_FCA_GATE_H_
#define L_TYPE_CA_CURRENT_FCA_GATE_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// L_type_Ca_current_fCa_gate States
enum LTypeCaCurrentFcaGateStates {
    L_TYPE_CA_CURRENT_FCA_GATE_Q0,
};

// L_type_Ca_current_fCa_gate Data Struct
typedef struct {
    
    // Declare Inputs
    double ca_i;
    double v;
    double time;
    
    // Declare Outputs
    double f_ca;
    
    // Declare Internal Variables
    double alpha_fca;
    double beta_fca;
    double gama_fca;
    double fca_inf;
    double tau_fca;
    double d_fca;

    // State
    enum LTypeCaCurrentFcaGateStates state;
} LTypeCaCurrentFcaGate;

// L_type_Ca_current_fCa_gate Initialisation function
void LTypeCaCurrentFcaGateInit(LTypeCaCurrentFcaGate* me);

// L_type_Ca_current_fCa_gate Execution function
void LTypeCaCurrentFcaGateRun(LTypeCaCurrentFcaGate* me);

#endif // L_TYPE_CA_CURRENT_FCA_GATE_H_