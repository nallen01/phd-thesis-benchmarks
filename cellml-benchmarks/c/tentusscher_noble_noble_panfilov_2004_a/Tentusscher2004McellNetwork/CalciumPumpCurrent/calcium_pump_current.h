#ifndef CALCIUM_PUMP_CURRENT_H_
#define CALCIUM_PUMP_CURRENT_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// calcium_pump_current States
enum CalciumPumpCurrentStates {
    CALCIUM_PUMP_CURRENT_Q0,
};

// calcium_pump_current Data Struct
typedef struct {
    
    // Declare Inputs
    double ca_i;
    
    // Declare Outputs
    double i_p_ca;

    // State
    enum CalciumPumpCurrentStates state;
} CalciumPumpCurrent;

// calcium_pump_current Initialisation function
void CalciumPumpCurrentInit(CalciumPumpCurrent* me);

// calcium_pump_current Execution function
void CalciumPumpCurrentRun(CalciumPumpCurrent* me);

#endif // CALCIUM_PUMP_CURRENT_H_