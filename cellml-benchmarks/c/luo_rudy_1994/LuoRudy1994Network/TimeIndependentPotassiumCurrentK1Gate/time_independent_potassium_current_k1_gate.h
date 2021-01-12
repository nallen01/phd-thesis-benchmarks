#ifndef TIME_INDEPENDENT_POTASSIUM_CURRENT_K1_GATE_H_
#define TIME_INDEPENDENT_POTASSIUM_CURRENT_K1_GATE_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// time_independent_potassium_current_K1_gate States
enum TimeIndependentPotassiumCurrentK1GateStates {
    TIME_INDEPENDENT_POTASSIUM_CURRENT_K1_GATE_Q0,
};

// time_independent_potassium_current_K1_gate Data Struct
typedef struct {
    
    // Declare Inputs
    double v;
    double time;
    double e_k1;
    
    // Declare Outputs
    double k1_infinity;
    
    // Declare Internal Variables
    double alpha_k1;
    double beta_k1;

    // State
    enum TimeIndependentPotassiumCurrentK1GateStates state;
} TimeIndependentPotassiumCurrentK1Gate;

// time_independent_potassium_current_K1_gate Initialisation function
void TimeIndependentPotassiumCurrentK1GateInit(TimeIndependentPotassiumCurrentK1Gate* me);

// time_independent_potassium_current_K1_gate Execution function
void TimeIndependentPotassiumCurrentK1GateRun(TimeIndependentPotassiumCurrentK1Gate* me);

#endif // TIME_INDEPENDENT_POTASSIUM_CURRENT_K1_GATE_H_