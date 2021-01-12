#ifndef SLOW_TIME_DEPENDENT_POTASSIUM_CURRENT_H_
#define SLOW_TIME_DEPENDENT_POTASSIUM_CURRENT_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// slow_time_dependent_potassium_current States
enum SlowTimeDependentPotassiumCurrentStates {
    SLOW_TIME_DEPENDENT_POTASSIUM_CURRENT_Q0,
};

// slow_time_dependent_potassium_current Data Struct
typedef struct {
    
    // Declare Inputs
    double e_ks;
    double time;
    double v;
    double xs_private;
    
    // Declare Outputs
    double i_ks;
    double time_private;
    double v_private;
    
    // Declare Internal Variables
    double xs;

    // State
    enum SlowTimeDependentPotassiumCurrentStates state;
} SlowTimeDependentPotassiumCurrent;

// slow_time_dependent_potassium_current Initialisation function
void SlowTimeDependentPotassiumCurrentInit(SlowTimeDependentPotassiumCurrent* me);

// slow_time_dependent_potassium_current Execution function
void SlowTimeDependentPotassiumCurrentRun(SlowTimeDependentPotassiumCurrent* me);

#endif // SLOW_TIME_DEPENDENT_POTASSIUM_CURRENT_H_