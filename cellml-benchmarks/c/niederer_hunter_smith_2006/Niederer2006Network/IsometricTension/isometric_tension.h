#ifndef ISOMETRIC_TENSION_H_
#define ISOMETRIC_TENSION_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// isometric_tension States
enum IsometricTensionStates {
    ISOMETRIC_TENSION_Q0,
};

// isometric_tension Data Struct
typedef struct {
    
    // Declare Inputs
    double t_base;
    double overlap;
    
    // Declare Outputs
    double t_0;

    // State
    enum IsometricTensionStates state;
} IsometricTension;

// isometric_tension Initialisation function
void IsometricTensionInit(IsometricTension* me);

// isometric_tension Execution function
void IsometricTensionRun(IsometricTension* me);

#endif // ISOMETRIC_TENSION_H_