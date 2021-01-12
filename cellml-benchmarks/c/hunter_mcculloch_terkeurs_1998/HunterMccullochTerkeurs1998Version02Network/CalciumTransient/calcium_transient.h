#ifndef CALCIUM_TRANSIENT_H_
#define CALCIUM_TRANSIENT_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// calcium_transient States
enum CalciumTransientStates {
    CALCIUM_TRANSIENT_Q0,
};

// calcium_transient Data Struct
typedef struct {
    
    // Declare Inputs
    double time;
    
    // Declare Outputs
    double ca_i;

    // State
    enum CalciumTransientStates state;
} CalciumTransient;

// calcium_transient Initialisation function
void CalciumTransientInit(CalciumTransient* me);

// calcium_transient Execution function
void CalciumTransientRun(CalciumTransient* me);

#endif // CALCIUM_TRANSIENT_H_