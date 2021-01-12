#ifndef SODIUM_DYNAMICS_H_
#define SODIUM_DYNAMICS_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// sodium_dynamics States
enum SodiumDynamicsStates {
    SODIUM_DYNAMICS_Q0,
};

// sodium_dynamics Data Struct
typedef struct {
    
    // Declare Inputs
    double time;
    double f;
    double cm;
    double v_c;
    double i_na;
    double i_naca;
    double i_nak;
    double i_b_na;
    
    // Declare Outputs
    double na_i;
    double na_o;

    // State
    enum SodiumDynamicsStates state;
} SodiumDynamics;

// sodium_dynamics Initialisation function
void SodiumDynamicsInit(SodiumDynamics* me);

// sodium_dynamics Execution function
void SodiumDynamicsRun(SodiumDynamics* me);

#endif // SODIUM_DYNAMICS_H_