#ifndef POTASSIUM_PUMP_CURRENT_H_
#define POTASSIUM_PUMP_CURRENT_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// potassium_pump_current States
enum PotassiumPumpCurrentStates {
    POTASSIUM_PUMP_CURRENT_Q0,
};

// potassium_pump_current Data Struct
typedef struct {
    
    // Declare Inputs
    double e_k;
    double v;
    
    // Declare Outputs
    double i_p_k;

    // State
    enum PotassiumPumpCurrentStates state;
} PotassiumPumpCurrent;

// potassium_pump_current Initialisation function
void PotassiumPumpCurrentInit(PotassiumPumpCurrent* me);

// potassium_pump_current Execution function
void PotassiumPumpCurrentRun(PotassiumPumpCurrent* me);

#endif // POTASSIUM_PUMP_CURRENT_H_