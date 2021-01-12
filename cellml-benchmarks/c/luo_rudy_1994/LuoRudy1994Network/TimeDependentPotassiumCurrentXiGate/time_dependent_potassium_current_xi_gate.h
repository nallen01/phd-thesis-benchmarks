#ifndef TIME_DEPENDENT_POTASSIUM_CURRENT_XI_GATE_H_
#define TIME_DEPENDENT_POTASSIUM_CURRENT_XI_GATE_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// time_dependent_potassium_current_Xi_gate States
enum TimeDependentPotassiumCurrentXiGateStates {
    TIME_DEPENDENT_POTASSIUM_CURRENT_XI_GATE_Q0,
};

// time_dependent_potassium_current_Xi_gate Data Struct
typedef struct {
    
    // Declare Inputs
    double v;
    double time;
    
    // Declare Outputs
    double xi;

    // State
    enum TimeDependentPotassiumCurrentXiGateStates state;
} TimeDependentPotassiumCurrentXiGate;

// time_dependent_potassium_current_Xi_gate Initialisation function
void TimeDependentPotassiumCurrentXiGateInit(TimeDependentPotassiumCurrentXiGate* me);

// time_dependent_potassium_current_Xi_gate Execution function
void TimeDependentPotassiumCurrentXiGateRun(TimeDependentPotassiumCurrentXiGate* me);

#endif // TIME_DEPENDENT_POTASSIUM_CURRENT_XI_GATE_H_