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
    double i_ca_l;
    double i_k;
    double i_naca;
    double i_k1;
    double i_kp;
    double i_p_ca;
    double i_na_b;
    double i_ca_b;
    double i_nak;
    double i_ns_ca;
    
    // Declare Outputs
    double v;
    double r;
    double t;
    double f;
    double dv_dt;
    double i_stim_c;

    // State
    enum MembraneStates state;
} Membrane;

// membrane Initialisation function
void MembraneInit(Membrane* me);

// membrane Execution function
void MembraneRun(Membrane* me);

#endif // MEMBRANE_H_