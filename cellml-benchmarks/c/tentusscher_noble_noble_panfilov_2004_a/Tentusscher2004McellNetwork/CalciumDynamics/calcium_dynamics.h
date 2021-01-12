#ifndef CALCIUM_DYNAMICS_H_
#define CALCIUM_DYNAMICS_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// calcium_dynamics States
enum CalciumDynamicsStates {
    CALCIUM_DYNAMICS_Q0,
};

// calcium_dynamics Data Struct
typedef struct {
    
    // Declare Inputs
    double v;
    double v_c;
    double time;
    double d;
    double f;
    double cm;
    double i_cal;
    double i_naca;
    double i_p_ca;
    double i_b_ca;
    
    // Declare Outputs
    double ca_i;
    double ca_o;
    
    // Declare Internal Variables
    double ca_sr;
    double i_rel;
    double i_up;
    double i_leak;
    double g;
    double g_inf;
    double ca_i_bufc;
    double ca_sr_bufsr;
    double d_g;

    // State
    enum CalciumDynamicsStates state;
} CalciumDynamics;

// calcium_dynamics Initialisation function
void CalciumDynamicsInit(CalciumDynamics* me);

// calcium_dynamics Execution function
void CalciumDynamicsRun(CalciumDynamics* me);

#endif // CALCIUM_DYNAMICS_H_