#ifndef LENGTH_INDEPENDENT_TENSION_H_
#define LENGTH_INDEPENDENT_TENSION_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// length_independent_tension States
enum LengthIndependentTensionStates {
    LENGTH_INDEPENDENT_TENSION_Q0,
};

// length_independent_tension Data Struct
typedef struct {
    
    // Declare Inputs
    double z;
    double z_max;
    
    // Declare Outputs
    double t_ref;
    double t_base;

    // State
    enum LengthIndependentTensionStates state;
} LengthIndependentTension;

// length_independent_tension Initialisation function
void LengthIndependentTensionInit(LengthIndependentTension* me);

// length_independent_tension Execution function
void LengthIndependentTensionRun(LengthIndependentTension* me);

#endif // LENGTH_INDEPENDENT_TENSION_H_