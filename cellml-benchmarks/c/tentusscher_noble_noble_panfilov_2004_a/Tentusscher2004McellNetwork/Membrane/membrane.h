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
    double i_k1;
    double i_to;
    double i_kr;
    double i_ks;
    double i_cal;
    double i_nak;
    double i_na;
    double i_b_na;
    double i_naca;
    double i_b_ca;
    double i_p_k;
    double i_p_ca;
    
    // Declare Outputs
    double v;
    double r;
    double t;
    double f;
    double cm;
    double v_c;
    double i_stim;

    // State
    enum MembraneStates state;
} Membrane;

// membrane Initialisation function
void MembraneInit(Membrane* me);

// membrane Execution function
void MembraneRun(Membrane* me);

#endif // MEMBRANE_H_