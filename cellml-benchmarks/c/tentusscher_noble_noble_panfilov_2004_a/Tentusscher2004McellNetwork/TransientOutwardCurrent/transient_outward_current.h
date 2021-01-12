#ifndef TRANSIENT_OUTWARD_CURRENT_H_
#define TRANSIENT_OUTWARD_CURRENT_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// transient_outward_current States
enum TransientOutwardCurrentStates {
    TRANSIENT_OUTWARD_CURRENT_Q0,
};

// transient_outward_current Data Struct
typedef struct {
    
    // Declare Inputs
    double e_k;
    double v;
    double time;
    double s_private;
    double r_private;
    
    // Declare Outputs
    double i_to;
    double v_private;
    double time_private;
    
    // Declare Internal Variables
    double s;
    double r;

    // State
    enum TransientOutwardCurrentStates state;
} TransientOutwardCurrent;

// transient_outward_current Initialisation function
void TransientOutwardCurrentInit(TransientOutwardCurrent* me);

// transient_outward_current Execution function
void TransientOutwardCurrentRun(TransientOutwardCurrent* me);

#endif // TRANSIENT_OUTWARD_CURRENT_H_