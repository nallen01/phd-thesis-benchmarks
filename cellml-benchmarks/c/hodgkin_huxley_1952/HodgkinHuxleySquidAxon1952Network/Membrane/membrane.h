#ifndef MEMBRANE_H_
#define MEMBRANE_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// membrane States
enum MembraneStates {
    MEMBRANE_Q0,
};

// membrane Data Struct
typedef struct {
    
    // Declare Inputs
    double time;
    double i_na;
    double i_k;
    double i_l;
    
    // Declare Outputs
    double v;
    double e_r;
    
    // Declare Internal Variables
    double i_stim;

    // State
    enum MembraneStates state;
} Membrane;

// membrane Initialisation function
void MembraneInit(Membrane* me);

// membrane Execution function
void MembraneRun(Membrane* me);

#endif // MEMBRANE_H_