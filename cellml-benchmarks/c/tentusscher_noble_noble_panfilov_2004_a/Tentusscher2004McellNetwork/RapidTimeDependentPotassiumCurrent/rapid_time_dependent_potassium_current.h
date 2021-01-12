#ifndef RAPID_TIME_DEPENDENT_POTASSIUM_CURRENT_H_
#define RAPID_TIME_DEPENDENT_POTASSIUM_CURRENT_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// rapid_time_dependent_potassium_current States
enum RapidTimeDependentPotassiumCurrentStates {
    RAPID_TIME_DEPENDENT_POTASSIUM_CURRENT_Q0,
};

// rapid_time_dependent_potassium_current Data Struct
typedef struct {
    
    // Declare Inputs
    double e_k;
    double k_o;
    double time;
    double v;
    double xr1_private;
    double xr2_private;
    
    // Declare Outputs
    double i_kr;
    double time_private;
    double v_private;
    
    // Declare Internal Variables
    double xr1;
    double xr2;

    // State
    enum RapidTimeDependentPotassiumCurrentStates state;
} RapidTimeDependentPotassiumCurrent;

// rapid_time_dependent_potassium_current Initialisation function
void RapidTimeDependentPotassiumCurrentInit(RapidTimeDependentPotassiumCurrent* me);

// rapid_time_dependent_potassium_current Execution function
void RapidTimeDependentPotassiumCurrentRun(RapidTimeDependentPotassiumCurrent* me);

#endif // RAPID_TIME_DEPENDENT_POTASSIUM_CURRENT_H_