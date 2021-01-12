#ifndef LEAKAGE_CURRENT_H_
#define LEAKAGE_CURRENT_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// leakage_current States
enum LeakageCurrentStates {
    LEAKAGE_CURRENT_Q0,
};

// leakage_current Data Struct
typedef struct {
    
    // Declare Inputs
    double time;
    double v;
    double e_r;
    
    // Declare Outputs
    double i_l;
    
    // Declare Internal Variables
    double e_l;

    // State
    enum LeakageCurrentStates state;
} LeakageCurrent;

// leakage_current Initialisation function
void LeakageCurrentInit(LeakageCurrent* me);

// leakage_current Execution function
void LeakageCurrentRun(LeakageCurrent* me);

#endif // LEAKAGE_CURRENT_H_