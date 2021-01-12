#ifndef TIME_INDEPENDENT_POTASSIUM_CURRENT_H_
#define TIME_INDEPENDENT_POTASSIUM_CURRENT_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// time_independent_potassium_current States
enum TimeIndependentPotassiumCurrentStates {
    TIME_INDEPENDENT_POTASSIUM_CURRENT_Q0,
};

// time_independent_potassium_current Data Struct
typedef struct {
    
    // Declare Inputs
    double time;
    double v;
    double ko;
    double ki;
    double r;
    double t;
    double f;
    double k1_infinity_private;
    
    // Declare Outputs
    double i_k1;
    double e_k1;
    double time_private;
    double v_private;
    
    // Declare Internal Variables
    double g_k1;
    double k1_infinity;

    // State
    enum TimeIndependentPotassiumCurrentStates state;
} TimeIndependentPotassiumCurrent;

// time_independent_potassium_current Initialisation function
void TimeIndependentPotassiumCurrentInit(TimeIndependentPotassiumCurrent* me);

// time_independent_potassium_current Execution function
void TimeIndependentPotassiumCurrentRun(TimeIndependentPotassiumCurrent* me);

#endif // TIME_INDEPENDENT_POTASSIUM_CURRENT_H_