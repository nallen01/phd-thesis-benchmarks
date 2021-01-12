#ifndef TIME_DEPENDENT_POTASSIUM_CURRENT_X_GATE_H_
#define TIME_DEPENDENT_POTASSIUM_CURRENT_X_GATE_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// time_dependent_potassium_current_X_gate States
enum TimeDependentPotassiumCurrentXGateStates {
    TIME_DEPENDENT_POTASSIUM_CURRENT_X_GATE_Q0,
};

// time_dependent_potassium_current_X_gate Data Struct
typedef struct {
    
    // Declare Inputs
    double v;
    double time;
    
    // Declare Outputs
    double x;
    
    // Declare Internal Variables
    double alpha_x;
    double beta_x;

    // State
    enum TimeDependentPotassiumCurrentXGateStates state;
} TimeDependentPotassiumCurrentXGate;

// time_dependent_potassium_current_X_gate Initialisation function
void TimeDependentPotassiumCurrentXGateInit(TimeDependentPotassiumCurrentXGate* me);

// time_dependent_potassium_current_X_gate Execution function
void TimeDependentPotassiumCurrentXGateRun(TimeDependentPotassiumCurrentXGate* me);

#endif // TIME_DEPENDENT_POTASSIUM_CURRENT_X_GATE_H_