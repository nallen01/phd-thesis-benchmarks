#ifndef SLOW_TIME_DEPENDENT_POTASSIUM_CURRENT_XS_GATE_H_
#define SLOW_TIME_DEPENDENT_POTASSIUM_CURRENT_XS_GATE_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// slow_time_dependent_potassium_current_Xs_gate States
enum SlowTimeDependentPotassiumCurrentXsGateStates {
    SLOW_TIME_DEPENDENT_POTASSIUM_CURRENT_XS_GATE_Q0,
};

// slow_time_dependent_potassium_current_Xs_gate Data Struct
typedef struct {
    
    // Declare Inputs
    double v;
    double time;
    
    // Declare Outputs
    double xs;
    
    // Declare Internal Variables
    double xs_inf;
    double alpha_xs;
    double beta_xs;
    double tau_xs;

    // State
    enum SlowTimeDependentPotassiumCurrentXsGateStates state;
} SlowTimeDependentPotassiumCurrentXsGate;

// slow_time_dependent_potassium_current_Xs_gate Initialisation function
void SlowTimeDependentPotassiumCurrentXsGateInit(SlowTimeDependentPotassiumCurrentXsGate* me);

// slow_time_dependent_potassium_current_Xs_gate Execution function
void SlowTimeDependentPotassiumCurrentXsGateRun(SlowTimeDependentPotassiumCurrentXsGate* me);

#endif // SLOW_TIME_DEPENDENT_POTASSIUM_CURRENT_XS_GATE_H_