#ifndef POTASSIUM_DYNAMICS_H_
#define POTASSIUM_DYNAMICS_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// potassium_dynamics States
enum PotassiumDynamicsStates {
    POTASSIUM_DYNAMICS_Q0,
};

// potassium_dynamics Data Struct
typedef struct {
    
    // Declare Inputs
    double time;
    double f;
    double cm;
    double v_c;
    double i_k1;
    double i_to;
    double i_nak;
    double i_kr;
    double i_ks;
    double i_p_k;
    double i_stim;
    
    // Declare Outputs
    double k_i;
    double k_o;

    // State
    enum PotassiumDynamicsStates state;
} PotassiumDynamics;

// potassium_dynamics Initialisation function
void PotassiumDynamicsInit(PotassiumDynamics* me);

// potassium_dynamics Execution function
void PotassiumDynamicsRun(PotassiumDynamics* me);

#endif // POTASSIUM_DYNAMICS_H_