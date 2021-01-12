#ifndef L_TYPE_CA_CURRENT_H_
#define L_TYPE_CA_CURRENT_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// L_type_Ca_current States
enum LTypeCaCurrentStates {
    L_TYPE_CA_CURRENT_Q0,
};

// L_type_Ca_current Data Struct
typedef struct {
    
    // Declare Inputs
    double ca_o;
    double ca_i;
    double r;
    double f;
    double t;
    double time;
    double v;
    double d_private;
    double f1_private;
    double fca_private;
    
    // Declare Outputs
    double i_cal;
    double ca_i_private;
    double time_private;
    double v_private;
    double d;
    
    // Declare Internal Variables
    double f1;
    double f_ca;

    // State
    enum LTypeCaCurrentStates state;
} LTypeCaCurrent;

// L_type_Ca_current Initialisation function
void LTypeCaCurrentInit(LTypeCaCurrent* me);

// L_type_Ca_current Execution function
void LTypeCaCurrentRun(LTypeCaCurrent* me);

#endif // L_TYPE_CA_CURRENT_H_