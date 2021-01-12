#ifndef REVERSAL_POTENTIALS_H_
#define REVERSAL_POTENTIALS_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// reversal_potentials States
enum ReversalPotentialsStates {
    REVERSAL_POTENTIALS_Q0,
};

// reversal_potentials Data Struct
typedef struct {
    
    // Declare Inputs
    double k_o;
    double na_o;
    double k_i;
    double na_i;
    double ca_o;
    double ca_i;
    double r;
    double f;
    double t;
    double time;
    
    // Declare Outputs
    double e_na;
    double e_k;
    double e_ks;
    double e_ca;

    // State
    enum ReversalPotentialsStates state;
} ReversalPotentials;

// reversal_potentials Initialisation function
void ReversalPotentialsInit(ReversalPotentials* me);

// reversal_potentials Execution function
void ReversalPotentialsRun(ReversalPotentials* me);

#endif // REVERSAL_POTENTIALS_H_