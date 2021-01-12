#ifndef RAPID_TIME_DEPENDENT_POTASSIUM_CURRENT_XR2_GATE_H_
#define RAPID_TIME_DEPENDENT_POTASSIUM_CURRENT_XR2_GATE_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// rapid_time_dependent_potassium_current_Xr2_gate States
enum RapidTimeDependentPotassiumCurrentXr2GateStates {
    RAPID_TIME_DEPENDENT_POTASSIUM_CURRENT_XR2_GATE_Q0,
};

// rapid_time_dependent_potassium_current_Xr2_gate Data Struct
typedef struct {
    
    // Declare Inputs
    double v;
    double time;
    
    // Declare Outputs
    double xr2;
    
    // Declare Internal Variables
    double xr2_inf;
    double alpha_xr2;
    double beta_xr2;
    double tau_xr2;

    // State
    enum RapidTimeDependentPotassiumCurrentXr2GateStates state;
} RapidTimeDependentPotassiumCurrentXr2Gate;

// rapid_time_dependent_potassium_current_Xr2_gate Initialisation function
void RapidTimeDependentPotassiumCurrentXr2GateInit(RapidTimeDependentPotassiumCurrentXr2Gate* me);

// rapid_time_dependent_potassium_current_Xr2_gate Execution function
void RapidTimeDependentPotassiumCurrentXr2GateRun(RapidTimeDependentPotassiumCurrentXr2Gate* me);

#endif // RAPID_TIME_DEPENDENT_POTASSIUM_CURRENT_XR2_GATE_H_