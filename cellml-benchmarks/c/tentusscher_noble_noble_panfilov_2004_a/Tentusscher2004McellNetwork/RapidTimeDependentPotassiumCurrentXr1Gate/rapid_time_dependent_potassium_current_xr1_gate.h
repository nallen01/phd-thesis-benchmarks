#ifndef RAPID_TIME_DEPENDENT_POTASSIUM_CURRENT_XR1_GATE_H_
#define RAPID_TIME_DEPENDENT_POTASSIUM_CURRENT_XR1_GATE_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// rapid_time_dependent_potassium_current_Xr1_gate States
enum RapidTimeDependentPotassiumCurrentXr1GateStates {
    RAPID_TIME_DEPENDENT_POTASSIUM_CURRENT_XR1_GATE_Q0,
};

// rapid_time_dependent_potassium_current_Xr1_gate Data Struct
typedef struct {
    
    // Declare Inputs
    double v;
    double time;
    
    // Declare Outputs
    double xr1;
    
    // Declare Internal Variables
    double xr1_inf;
    double alpha_xr1;
    double beta_xr1;
    double tau_xr1;

    // State
    enum RapidTimeDependentPotassiumCurrentXr1GateStates state;
} RapidTimeDependentPotassiumCurrentXr1Gate;

// rapid_time_dependent_potassium_current_Xr1_gate Initialisation function
void RapidTimeDependentPotassiumCurrentXr1GateInit(RapidTimeDependentPotassiumCurrentXr1Gate* me);

// rapid_time_dependent_potassium_current_Xr1_gate Execution function
void RapidTimeDependentPotassiumCurrentXr1GateRun(RapidTimeDependentPotassiumCurrentXr1Gate* me);

#endif // RAPID_TIME_DEPENDENT_POTASSIUM_CURRENT_XR1_GATE_H_