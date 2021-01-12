#ifndef TIME_DEPENDENT_POTASSIUM_CURRENT_H_
#define TIME_DEPENDENT_POTASSIUM_CURRENT_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// time_dependent_potassium_current States
enum TimeDependentPotassiumCurrentStates {
    TIME_DEPENDENT_POTASSIUM_CURRENT_Q0,
};

// time_dependent_potassium_current Data Struct
typedef struct {
    
    // Declare Inputs
    double time;
    double v;
    double r;
    double t;
    double f;
    double ko;
    double ki;
    double nao;
    double nai;
    double x_private;
    double xi_private;
    
    // Declare Outputs
    double i_k;
    double time_private;
    double v_private;
    
    // Declare Internal Variables
    double g_k;
    double e_k;
    double x;
    double xi;

    // State
    enum TimeDependentPotassiumCurrentStates state;
} TimeDependentPotassiumCurrent;

// time_dependent_potassium_current Initialisation function
void TimeDependentPotassiumCurrentInit(TimeDependentPotassiumCurrent* me);

// time_dependent_potassium_current Execution function
void TimeDependentPotassiumCurrentRun(TimeDependentPotassiumCurrent* me);

#endif // TIME_DEPENDENT_POTASSIUM_CURRENT_H_